#!/bin/bash

sudo echo "[Desktop Entry]" > /usr/share/applications/Oasys.desktop
sudo echo "Type=Application" >> /usr/share/applications/Oasys.desktop
sudo echo "Terminal=false" >> /usr/share/applications/Oasys.desktop
sudo echo "Name=Oasys" >> /usr/share/applications/Oasys.desktop

sudo echo "Icon="`find /home -name "start_oasys.sh" -printf "%h"`"/oasys.png" >> /usr/share/applications/Oasys.desktop
sudo echo "Exec="`find /home -name "start_oasys.sh" -printf "%h"`"/start_oasys.sh" >> /usr/share/applications/Oasys.desktop
