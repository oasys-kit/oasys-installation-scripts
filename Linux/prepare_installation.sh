#!/bin/bash

read -p "Update apt/yum? [y/N]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    apt-get update || yum update
fi

read -p "Install GIT [y/N]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    apt-get install git || yum install git
fi

echo "[Desktop Entry]" > /usr/share/applications/Oasys.desktop
echo "Type=Application" >> /usr/share/applications/Oasys.desktop
echo "Terminal=false" >> /usr/share/applications/Oasys.desktop
echo "Name=Oasys" >> /usr/share/applications/Oasys.desktop

CUR_PATH=$(pwd)

echo "Icon=$CUR_PATH/oasys.png" >> /usr/share/applications/Oasys.desktop
echo "Exec=$CUR_PATH/start_oasys.sh" >> /usr/share/applications/Oasys.desktop
