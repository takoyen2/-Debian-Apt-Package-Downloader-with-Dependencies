<p align="center">
  <img src="https://img.shields.io/badge/Debian%2FUbuntu-APT%20Offline%20Downloader-blue?style=for-the-badge&logo=linux" alt="APT Offline Downloader"/>
  <br><b>Download .deb packages + all dependencies — for offline install</b>
</p>

---

## Features
- **Bulk input** — space-separated packages  
- **Full recursive dependencies** via `apt-get install -s`  
- **Timestamped folders** — auto-organized  
- **Safe overwrite** — confirmation prompt  
- **Self-contained `download.sh`** — resumable  
- **One-click `install_all.sh`** — offline install  
- **Detailed logs** + success/failure report  

---

## How to Use

```bash
# Clone & run
git clone https://github.com/takoyen2/Debian-Apt-Package-Downloader-with-Dependencies.git
cd Debian-Apt-Package-Downloader-with-Dependencies
chmod +x apt-offline-downloader.sh
./apt-offline-downloader.sh

Enter package names to download: vim nginx curl python3 htop

All .deb files saved in:
downloaded_packages_20251028_153022/

cd downloaded_packages_20251028_153022
sudo ./install_all.sh

