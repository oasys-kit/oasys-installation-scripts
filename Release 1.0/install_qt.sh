#!/bin/bash

cd ..

apt-get install freeglut3-dev #open-gl

wget http://download.qt.io/archive/qt/5.8/5.8.0/single/qt-everywhere-opensource-src-5.8.0.tar.xz
tar -xvf qt-everywhere-opensource-src-5.8.0.tar.xz

cd qt-everywhere-opensource-src-5.8.0

echo "type 'o' and 'yes' when asked by the qt installator"

./configure
make 
make install

cd ..

wget http://sourceforge.net/projects/pyqt/files/sip/sip-4.19.2/sip-4.19.2.tar.gz
tar -xvf sip-4.19.2.tar.gz

cd sip-4.19.2

python3 configure.py

make 
make install

cd ..

wget http://sourceforge.net/projects/pyqt/files/PyQt5/PyQt5-5.8.2/PyQt5-5.8.2.tar.gz
tar -xvf PyQt5-5.8.2.tar.gz

cd PyQt5-5.8.2

python3 configure.py

make 
make install

cd ..
