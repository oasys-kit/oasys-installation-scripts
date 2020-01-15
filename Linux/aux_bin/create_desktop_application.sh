#!/bin/bash

echo "[Desktop Entry]" > /usr/share/applications/Oasys.desktop
echo "Type=Application" >> /usr/share/applications/Oasys.desktop
echo "Terminal=false" >> /usr/share/applications/Oasys.desktop
echo "Name=Oasys" >> /usr/share/applications/Oasys.desktop

CUR_PATH=$1

echo "Icon=$CUR_PATH/aux_bin/oasys.png" >> /usr/share/applications/Oasys.desktop
echo "Exec=$CUR_PATH/start_oasys.sh" >> /usr/share/applications/Oasys.desktop

echo "/usr/share/applications/Oasys.desktop created"

