#!/bin/bash

echo "[Desktop Entry]" > /usr/share/applications/OasysVE.desktop
echo "Type=Application" >> /usr/share/applications/OasysVE.desktop
echo "Terminal=false" >> /usr/share/applications/OasysVE.desktop
echo "Name=Oasys" >> /usr/share/applications/OasysVE.desktop

echo "Icon="`find /home -name "oasys.png" -printf "%h"`"/oasys.png" >> /usr/share/applications/OasysVE.desktop
echo "Exec="`find /home -name "start_oasys_VE.sh" -printf "%h"`"/start_oasys_VE.sh" >> /usr/share/applications/OasysVE.desktop
