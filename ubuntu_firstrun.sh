#!/bin/bash

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install Development Tools
sudo apt install -y nano git jq wget curl gpg
sudo apt install -y ca-certificates  apt-transport-https gnupg
sudo apt install -y unzip p7zip unrar
sudo apt install -y build-essential software-properties-common python3 python3-pip

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs npm

# Install Networking and Security Tools

sudo apt install -y whois net-tools ufw
sudo apt install -y  speedtest-cli


# Install Multimedia and Graphics Tools
sudo apt install -y kolourpaint
# sudo apt install -y imagemagick inkscape gimp
sudo apt install -y ffmpeg vlc
#sudo apt install -y obs-studio

sudo apt install -y gnome-shell-extension-manager gnome-browser-connector gnome-tweaks 
sudo apt install -y ubuntu-restricted-extras ubuntu-drivers-common
# sudo apt install -y unattended-upgrades
sudo apt install -y deja-dup dconf-editor
sudo apt install -y gparted

########################################
# Install Google Chrome
# wget --progress=dot:giga "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O /tmp/chrome_stable_current_amd64.deb
# sudo apt install -y /tmp/chrome_stable_current_amd64.deb

# wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo tee /etc/apt/trusted.gpg.d/google.asc >/dev/null
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt update
sudo apt install google-chrome-stable

########################################
# Install Visual Studio Code
# wget --progress=dot:giga 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O /tmp/code_latest_amd64.deb
# sudo apt install -y /tmp/code_latest_amd64.deb

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

sudo apt update
sudo apt install code # or code-insiders


########################################
# # Install Kodi Media Center
# sudo add-apt-repository -y ppa:team-xbmc/ppa
# sudo apt update
# sudo apt install -y kodi

########################################
# Install AnyDesk
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY -o /etc/apt/keyrings/keys.anydesk.com.asc
sudo chmod a+r /etc/apt/keyrings/keys.anydesk.com.asc
echo "deb [signed-by=/etc/apt/keyrings/keys.anydesk.com.asc] https://deb.anydesk.com all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list > /dev/null
sudo apt update
sudo apt install -y anydesk

# Enable and configure UFW firewall
sudo ufw enable
sudo ufw status


# Install snapd
sudo apt install -y snapd
sudo snap install core # additional recommended snap packages

# Perform initial cleanup
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
sudo apt clean

# Set current Nautilus sort order
gsettings set org.gnome.nautilus.preferences default-sort-order 'mtime'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences date-time-format 'detailed'
gsettings set org.gnome.nautilus.preferences show-hidden-files "true"
gsettings set "org.gnome.desktop.notifications" "show-in-lock-screen" "false"
gsettings set org.gnome.nautilus.list-view default-column-order ['name', 'size', 'type', 'owner', 'group', 'permissions', 'date_modified', 'date_accessed', 'date_created', 'recency', 'detailed_type']
gsettings set org.gnome.nautilus.list-view default-visible-columns ['name', 'size', 'type', 'date_modified', 'date_created', 'detailed_type']
gsettings set org.gnome.nautilus.list-view use-tree-view true
gsettings set "org.gnome.desktop.session" "idle-delay" "uint32 300"
gsettings set "org.gnome.settings-daemon.plugins.power" "power-button-action" "suspend"
gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.clocks world-clocks "[{'location': <(uint32 2, <('Tel Aviv', 'LLBG', true, [(0.55850536063818546, 0.60911990894602097)], [(0.55966891929061258, 0.60679280909445943)])>)>}, {'location': <(uint32 2, <('London', 'EGWU', true, [(0.89971722940307675, -0.007272211034407213)], [(0.89884456477707964, -0.0020362232784242244)])>)>}, {'location': <(uint32 2, <('Los Angeles', 'KCQT', true, [(0.59370283970450188, -2.0644336110828618)], [(0.59432360095955872, -2.063741622941031)])>)>}]"
gsettings set org.gnome.clocks geolocation true
gsettings set com.ubuntu.touch.network gps false
gsettings set "org.gnome.shell" "favorite-apps" "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'code.desktop', 'org.gnome.TextEditor.desktop', 'firefox_firefox.desktop', 'chrome-hpfldicfbfomlpcikngkocigghgafkph-Default.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'

# Final message
echo "setup completed successfully! Please reboot your system."
