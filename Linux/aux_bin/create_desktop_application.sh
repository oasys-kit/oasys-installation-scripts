#!/bin/bash

echo "[Desktop Entry]" > /usr/share/applications/Oasys.desktop
echo "Type=Application" >> /usr/share/applications/Oasys.desktop
echo "Terminal=false" >> /usr/share/applications/Oasys.desktop
echo "Name=Oasys" >> /usr/share/applications/Oasys.desktop

AUX_PATH=$1

echo "Icon=$AUX_PATH/oasys.png" >> /usr/share/applications/Oasys.desktop
echo "Exec=$AUX_PATH/start_oasys.sh" >> /usr/share/applications/Oasys.desktop

echo "/usr/share/applications/Oasys.desktop created"

