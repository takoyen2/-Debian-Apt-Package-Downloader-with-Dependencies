<p align="center">
  <img src="https://img.shields.io/badge/Debian%20%7C%20Ubuntu-Offline%20APT%20Downloader-blue?style=for-the-badge&logo=linux&logoColor=white" alt="Debian/Ubuntu"/>
  <br>
  <b><i>Download any package + all dependencies as .deb — for offline installs!</i></b>
</p>

---

## ✨ Features

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

## 🛠️ How to Use

```bash
# 1. Clone & run
git clone https://github.com/takoyen2/-Debian-Apt-Package-Downloader-with-Dependencies.git
cd -Debian-Apt-Package-Downloader-with-Dependencies
chmod +x apt-offline-downloader.sh



Prompt: Enter package names to download: 
Example: vim nginx curl python3 htop

All .deb files saved in:
downloaded_packages_20251028_153022/
Install offline on any system:


cd downloaded_packages_20251028_153022
sudo ./install_all.sh


💡 Perfect For

Offline mirrors
Air-gapped systems
Embedded / IoT
Disaster recovery
CTF / Pentesting kits


🤝 Support the Project
Love this tool? Send Monero — 100% anonymous, no KYC

  
  
    <img src="https://img.shields.io/badge/Donate%20with-Monero-orange?style=for-the-badge&#x26;logo=monero&#x26;logoColor=white" alt="Donate with Monero">
  
    
  
  
    <img src="https://api.qrserver.com/v1/create-qr-code/?size=140x140&#x26;data=monero:ВАШ_АДРЕС_ТУТ&#x26;color=000000&#x26;bgcolor=FFFFFF" width="140" alt="Monero QR Code">
  


  Every XMR helps build more open-source tools! ☕


📦 Files

apt-offline-downloader.sh — main script
downloaded_packages_*/ — output folders
install_all.sh — generated installer


🛡️ Security

No network calls except apt
No root required for download
All .deb files from official repos



  
    <img src="https://img.shields.io/github/stars/takoyen2/-Debian-Apt-Package-Downloader-with-Dependencies?style=social" alt="Stars">
  
  
    <img src="https://img.shields.io/github/issues/takoyen2/-Debian-Apt-Package-Downloader-with-Dependencies?color=green" alt="Issues">
