#!/bin/bash

# Check if user is logged in as superuser
if [ $(id -u) -eq 0 ]; then
    # Delete folders
    rm -rf /etc/ohg_auto_login
    rm /etc/systemd/system/ohg_auto_login.service

    echo "Uninstalled ohg_auto_login scripts"
else
    echo "You must be logged in as superuser to run this script."
fi
