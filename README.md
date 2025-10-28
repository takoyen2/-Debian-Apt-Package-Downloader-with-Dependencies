<p align="center">
  <img src="https://img.shields.io/badge/Debian%20%7C%20Ubuntu-Offline%20APT%20Downloader-blue?style=for-the-badge&logo=linux&logoColor=white" alt="Debian/Ubuntu"/>
  <br>
  <b><i>Download any package + all dependencies as .deb — for offline installs!</i></b>
</p>

---

## Features

| Feature | Description |
|-------|-----------|
| **Bulk input** | Enter multiple packages (space-separated) |
| **Full dependencies** | Resolves recursively via `apt-get install -s` |
| **Timestamped folders** | Auto-organized: `downloaded_packages_YYYYMMDD_HHMMSS` |
| **Safe overwrite** | Asks before replacing existing folders |
| **Per-package `download.sh`** | Self-contained, resumable |
| **One-click `install_all.sh`** | Install everything offline with `sudo` |
| **Detailed logs** | Success/failure report + `download.log` |

---

## How to Use

```bash
# 1. Clone & run
git clone https://github.com/takoyen2/-Debian-Apt-Package-Downloader-with-Dependencies.git
cd -Debian-Apt-Package-Downloader-with-Dependencies
chmod +x apt-offline-downloader.sh

# 2. Launch
'./apt-offline-downloader.sh`

Prompt: Enter package names to download: 
Example: vim nginx curl python3 htop

Done! All .deb files saved in:
downloaded_packages_20251028_153022

# 3. Install
`cd downloaded_packages_20251028_153022`
`sudo ./install_all.sh`

or 

cd downloaded_packages_20251028_153022
`sudo dpkg -i vim/*.deb`
`sudo dpkg -i python3/*.deb`
