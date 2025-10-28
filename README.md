Offline .deb package collector for Debian/Ubuntu systems
A smart, user-friendly Bash script that lets you download any APT package along with all its dependencies as .deb files — perfect for offline installations, air-gapped environments, or system recovery.
No more missing dependencies!
Just enter package names — get a complete, ready-to-install offline bundle.

✨ Features

Bulk package input (space-separated)
Recursive dependency resolution via apt-get install -s
Automatic folder structure with timestamp
Safe overwrite protection with confirmation
Self-contained download.sh per package
One-click install_all.sh to install everything offline
Detailed logs & success/failure reports


🛠️ How to Use
chmod +x apt-offline-downloader.sh
./apt-offline-downloader.sh

Prompt: Enter package names to download: 
Example: vim nginx curl python3


All .deb files will be saved in a timestamped folder like:
downloaded_packages_20251028_153022/
Then install offline on any compatible system:

cd downloaded_packages_20251028_153022
sudo ./install_all.sh


💡 Perfect For

Creating offline mirrors
Embedded systems or IoT deployments
Disaster recovery kits
Pentesting / CTF toolkits


🤝 Support the Project
Love this tool? Help keep it alive!
<p align="center">
  <a href="monero:ВАШ_АДРЕС_ТУТ?tx_description=Support%20apt-offline-downloader">
    <img src="https://img.shields.io/badge/Donate-Monero-orange?logo=monero&logoColor=white&style=for-the-badge" alt="Donate with Monero" />
  </a>
</p>
Your support fuels more open-source tools like this!
