# Debian APT Offline Downloader
### *Download any package **with all dependencies** for **offline installation***

![Debian](https://img.shields.io/badge/Debian-A10000?style=flat&logo=debian&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=flat&logo=ubuntu&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Script-4EAA25?style=flat&logo=gnu-bash&logoColor=white)
![GitHub stars](https://img.shields.io/github/stars/takoyen2/Debian-Apt-Package-Downloader-with-Dependencies?style=social)

> **Perfect for:**  
> Air-gapped systems  
> Embedded / IoT devices  
> CTF & pentesting kits  
> Disaster recovery & backups

---

## Features

| Feature | Description |
|--------|-------------|
| **Bulk input** | Enter packages space-separated: `vim nginx curl python3` |
| **Full dependencies** | Recursive resolution via `apt-get install -s` |
| **Auto-organized** | Timestamped folder: `downloaded_packages_20251028_153022` |
| **Safe overwrite** | Confirmation prompt if folder exists |
| **Self-contained `download.sh`** | Resumable, per-run downloader |
| **One-click `install_all.sh`** | Install **everything offline** |
| **Detailed logs** | `download.log`, success/failure report |

---

## How to Use

```bash
# 1. Clone the repo
git clone https://github.com/takoyen2/Debian-Apt-Package-Downloader-with-Dependencies.git
cd Debian-Apt-Package-Downloader-with-Dependencies

# 2. Make script executable
chmod +x apt-offline-downloader.sh

# 3. Run (internet required *only here*)
./apt-offline-downloader.sh

Enter package names to download: vim nginx curl python3 htop

Done! All .deb files saved in:
downloaded_packages_20251028_153022

cd downloaded_packages_20251028_153022
sudo ./install_all.sh

or
cd downloaded_packages_20251028_153022
sudo dpkg -i python3/*.deb
