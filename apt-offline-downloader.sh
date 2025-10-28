#!/bin/bash

# Function to check if a package exists in repositories
check_package_exists() {
    if apt-cache show "$1" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Function to retrieve dependencies of a package
get_dependencies() {
    local package="$1"
    sudo apt-get install -s "$package" 2>/dev/null | grep "^Inst " | awk '{print $2}'
}

# Function to process a single package
process_package() {
    local package_name="$1"
    local folder_name="$2"
    
    echo "=== Processing package: $package_name ==="
    
    # Check if package exists
    if ! check_package_exists "$package_name"; then
        echo "Error: Package '$package_name' not found in repositories!"
        return 1
    fi
    
    # Create package subfolder
    local package_folder="$folder_name/$package_name"
    if [ -d "$package_folder" ]; then
        read -p "Folder '$package_folder' already exists. Overwrite? (y/N): " overwrite
        if [[ ! $overwrite =~ ^[Yy]$ ]]; then
            echo "Skipping package: $package_name"
            return 0
        fi
        rm -rf "$package_folder"
    fi
    mkdir -p "$package_folder"
    cd "$package_folder" || return 1
    
    echo "Resolving dependencies for: $package_name..."
    local dependencies=$(get_dependencies "$package_name")
    
    if [ -z "$dependencies" ]; then
        echo "Failed to resolve dependencies for '$package_name'"
        cd - > /dev/null
        return 1
    fi
    
    # Generate download script
    echo "Found $(echo "$dependencies" | wc -l) dependencies"
    echo "Creating download script..."
    
    cat > download.sh << EOF
#!/bin/bash
echo "Downloading packages to: $package_folder"
$(echo "$dependencies" | xargs echo "sudo apt download") > download.log 2>&1
if [ \$? -eq 0 ]; then
    echo "Successfully downloaded \$(ls -1 *.deb 2>/dev/null | wc -l) packages"
    echo "Log saved to download.log"
else
    echo "Download failed. Check download.log for details"
    exit 1
fi
EOF
    chmod +x download.sh
    
    echo "Starting download..."
    ./download.sh
    
    cd - > /dev/null
    echo "Done! Packages for '$package_name' saved in: $package_folder"
    return 0
}

# === Main Script ===
echo "=== APT Offline Package Downloader ==="
echo "Supports multiple packages (space-separated)"

read -p "Enter package names to download: " package_names
if [ -z "$package_names" ]; then
    echo "Error: No package names provided!"
    exit 1
fi

# Create main folder with timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")
folder_name="downloaded_packages_$timestamp"
mkdir -p "$folder_name"
echo "Created folder: $folder_name"

# Split input into array
IFS=' ' read -ra packages <<< "$package_names"

# Process each package
successful_packages=()
failed_packages=()

for package in "${packages[@]}"; do
    if process_package "$package" "$folder_name"; then
        successful_packages+=("$package")
    else
        failed_packages+=("$package")
    fi
    echo
done

# === Summary Report ===
echo "=== SUMMARY ==="
echo "Successfully processed: ${#successful_packages[@]} package(s)"
if [ ${#successful_packages[@]} -gt 0 ]; then
    echo "Successful: ${successful_packages[*]}"
    
    # Create universal install script
    cat > "$folder_name/install_all.sh" << 'EOF'
#!/bin/bash
echo "Installing all packages from $folder_name"
for pkg_dir in */; do
    if [ -d "$pkg_dir" ] && [ "$pkg_dir" != "./" ] && [ "$pkg_dir" != "../" ]; then
        echo "Installing from: $pkg_dir"
        if ls "$pkg_dir"/*.deb >/dev/null 2>&1; then
            sudo dpkg -i "$pkg_dir"/*.deb
        else
            echo "No .deb files in $pkg_dir"
        fi
    fi
done
echo "All packages installed"
EOF
    chmod +x "$folder_name/install_all.sh"
    
    echo "To install all packages offline:"
    echo "   cd $folder_name && sudo ./install_all.sh"
fi

if [ ${#failed_packages[@]} -gt 0 ]; then
    echo "Failed to process: ${#failed_packages[@]} package(s)"
    echo "Failed packages: ${failed_packages[*]}"
fi

echo "All files saved in: $folder_name"
