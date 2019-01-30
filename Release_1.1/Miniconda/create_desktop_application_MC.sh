#!/bin/bash

echo "[Desktop Entry]" > /usr/share/applications/OasysMC.desktop
echo "Type=Application" >> /usr/share/applications/OasysMC.desktop
echo "Terminal=false" >> /usr/share/applications/OasysMC.desktop
echo "Name=Oasys" >> /usr/share/applications/OasysMC.desktop

echo "Icon="`find /home -name "start_oasys_MC.sh" -printf "%h"`"/oasys.png" >> /usr/share/applications/OasysMC.desktop
echo "Exec="`find /home -name "start_oasys_MC.sh" -printf "%h"`"/start_oasys_MC.sh" >> /usr/share/applications/OasysMC.desktop
