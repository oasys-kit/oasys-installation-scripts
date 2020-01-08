#!/bin/bash

echo "[Desktop Entry]" > /usr/share/applications/Oasys.desktop
echo "Type=Application" >> /usr/share/applications/Oasys.desktop
echo "Terminal=false" >> /usr/share/applications/Oasys.desktop
echo "Name=Oasys" >> /usr/share/applications/Oasys.desktop

CUR_PATH=$(pwd)

echo "Icon=$CUR_PATH/oasys.png" >> /usr/share/applications/Oasys.desktop
echo "Exec=$CUR_PATH/start_oasys.sh" >> /usr/share/applications/Oasys.desktop

echo "Created Desktop Application: /usr/share/applications/Oasys.desktop"

