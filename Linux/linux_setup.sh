# Setup script for my school project
echo "Starting initiating the setup process for the program"

echo "Installing dependencies"

apt-get install git python3

git clone "https://github.com/Miquest/ohg_auto_login.git"

mv "ohg_auto_login"  "/etc"

echo "Copied the scripts to '/etc/ohg_auto_login'"
echo "Please insert your credentials to 'config.json' in the application folder"

echo "Installing systemd service for ohg_auto_login scripts"
mv "/etc/ohg_auto_login/ohg_auto_login.service" "/etc/systemd/system"

systemctl enable ohg_auto_login.service
systemctl start ohg_auto_login.service

echo "Setup process done! Enjoy my script. Don't forget to configure the credentials!"
