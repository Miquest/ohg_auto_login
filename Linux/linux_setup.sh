#!/bin/bash

# Debian-Paket-Repository zur sources.list hinzufügen
echo "Füge Debian-Paket-Repository zur sources.list hinzu..."
echo "deb http://deb.debian.org/debian/ buster main contrib non-free" >> /etc/apt/sources.list

# Aktualisiere die Paketlisten
echo "Aktualisiere die Paketlisten..."
apt update

# Lösche das Debian-Paket-Repository aus der sources.list
echo "Lösche das Debian-Paket-Repository aus der sources.list..."
sed -i '/deb http:\/\/deb.debian.org\/debian\/ buster main contrib non-free/d' /etc/apt/sources.list

# Aktualisiere erneut, um das Repository zu deaktivieren
echo "Aktualisiere die Paketlisten erneut..."
apt update

echo "Das Debian-Paket-Repository wurde erfolgreich zur sources.list hinzugefügt und anschließend entfernt. Die Paketlisten wurden aktualisiert."

# Optional: Du kannst hier weitere Befehle oder Anpassungen hinzufügen, je nach Bedarf.


# Setup script for my school project
echo "Starting initiating the setup process for the program"

echo "Installing dependencies"

# Install dependencies!
apt-get install git python3 python3-pip
python3 -m pip install requests

git clone "https://github.com/Miquest/ohg_auto_login.git"

mv "ohg_auto_login/Linux"  "/etc/ohg_auto_login"
rm -rf "ohg_auto_login"

echo "Copied the scripts to '/etc/ohg_auto_login'"
echo "Please insert your credentials to 'config.json' in the application folder"

echo "Installing systemd service for ohg_auto_login scripts"
mv "/etc/ohg_auto_login/ohg_auto_login.service" "/etc/systemd/system"

systemctl enable ohg_auto_login.service
systemctl start ohg_auto_login.service

echo "Setup process done! Enjoy my script. Don't forget to configure the credentials!"
