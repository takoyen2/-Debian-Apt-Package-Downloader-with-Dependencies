<p align="center">
  <img src="https://img.shields.io/badge/Debian/Ubuntu-APT%20Offline%20Downloader-blue?style=for-the-badge&logo=linux" alt="APT Offline Downloader"/>
  <br><b>Download .deb packages + all dependencies — for offline install</b>
</p>

---

## Features
- Multiple packages (space-separated)  
- Full recursive dependencies (`apt-get install -s`)  
- Timestamped folders  
- Safe overwrite with prompt  
- Per-package `download.sh`  
- One-click `install_all.sh`  
- Full logs + success/failure report  

---

## How to Use

```bash
git clone https://github.com/takoyen2/-Debian-Apt-Package-Downloader-with-Dependencies.git
cd -Debian-Apt-Package-Downloader-with-Dependencies
chmod +x apt-offline-downloader.sh
./apt-offline-downloader.sh

Enter packages: vim nginx curl python3


Output: downloaded_packages_20250828_123456/


cd downloaded_packages_20250828_123456
sudo ./install_all.sh
