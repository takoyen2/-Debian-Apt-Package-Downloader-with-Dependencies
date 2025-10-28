<p align="center">
  <img src="https://img.shields.io/badge/Debian%20%7C%20Ubuntu-Offline%20APT%20Downloader-blue?style=for-the-badge&logo=linux&logoColor=white" alt="Debian/Ubuntu"/>
  <br>
  <b><i>📦 Download any package + all dependencies as .deb — for offline installs!</i></b>
</p>

<h1 align="center">APT Offline Downloader</h1>

<p align="center">
  A powerful Bash script to download Debian/Ubuntu packages with all dependencies for offline installation
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Bash-Script-green?style=flat-square&logo=gnu-bash&logoColor=white" alt="Bash"/>
  <img src="https://img.shields.io/badge/Platform-Linux-lightgrey?style=flat-square&logo=linux&logoColor=white" alt="Platform"/>
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=flat-square" alt="License"/>
</p>

---

## ✨ Features

<div align="center">

| 🚀 Feature | 📝 Description |
|-----------|---------------|
| **📥 Bulk Input** | Download multiple packages at once (space-separated) |
| **🔗 Full Dependency Resolution** | Automatically resolves all recursive dependencies via `apt-get install -s` |
| **📁 Smart Organization** | Timestamped folders: `downloaded_packages_YYYYMMDD_HHMMSS` |
| **🛡️ Safe Operations** | Asks for confirmation before overwriting existing folders |
| **⚡ Resumable Downloads** | Per-package `download.sh` scripts for easy resuming |
| **🔧 One-Click Installation** | Comprehensive `install_all.sh` for offline installation |
| **📊 Detailed Logging** | Success/failure reports + comprehensive `download.log` |

</div>

---

## 🚀 Quick Start

### 📋 Prerequisites
- Debian/Ubuntu based system
- `apt-get` and `dpkg` utilities
- Internet connection (for initial download)

### ⚡ Installation & Usage

```bash
# 1. Clone repository
git clone https://github.com/takoyen2/-Debian-Apt-Package-Downloader-with-Dependencies.git
cd -Debian-Apt-Package-Downloader-with-Dependencies

# 2. Make script executable
chmod +x apt-offline-downloader.sh

# 3. Run the script
./apt-offline-downloader.sh



###🎯 Example Usage

# When prompted, enter package names:
Enter package names to download: vim nginx curl python3 htop

# Script will create organized structure:
📦 downloaded_packages_20251028_153022/
├── 📁 vim/
│   ├── 📄 package1.deb
│   ├── 📄 package2.deb
│   └── 🔧 download.sh
├── 📁 nginx/
├── 📁 curl/
├── 🔧 install_all.sh
├── 📄 download.log
└── 📄 success_failure_report.txt



💻 Offline Installation

# Method 1: Install all packages at once
cd downloaded_packages_20251028_153022
sudo ./install_all.sh

# Method 2: Install specific packages
cd downloaded_packages_20251028_153022
sudo dpkg -i vim/*.deb
sudo dpkg -i python3/*.deb

# Method 3: Resume interrupted downloads
cd downloaded_packages_20251028_153022/vim
./download.sh


📁 Project Structure

apt-offline-downloader/
├── 🔧 apt-offline-downloader.sh    # Main script
├── 📄 README.md                    # This file
└── 📦 downloaded_packages_TIMESTAMP/
    ├── 📁 package1/               # Individual package directory
    │   ├── 📄 package.deb
    │   ├── 📄 dependencies.deb
    │   └── 🔧 download.sh         # Package-specific download script
    ├── 📁 package2/
    ├── 🔧 install_all.sh          # Master installation script
    ├── 📄 download.log            # Detailed download log
    └── 📄 success_failure_report.txt
...

