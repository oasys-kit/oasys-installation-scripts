#!/bin/bash

#===============================================================================
#
# script to update/install xraylib from github in linux

#
# Note that one must install libtool with apt-get 
#
#===============================================================================
#
#

# export all_proxy=http://proxy.esrf.fr:3128/

# clean old stuff

#define python
#source oasys1env/bin/activate
export MYPYTHON=/Applications/Oasys1.1.app/Contents/MacOS/python
export PYTHON_SITE_PACKAGES=`$MYPYTHON -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

echo "Cleaning old installation files..."
rm -rf xraylib
rm $PYTHON_SITE_PACKAGES/xraylib*
rm $PYTHON_SITE_PACKAGES/_xraylib*


# xraylib
echo "Installing Oasys dependency xraylib"
# curl -O http://lvserver.ugent.be/xraylib/xraylib-3.1.0.tar.gz
# tar xvfz xraylib-3.1.0.tar.gz
# cd xraylib-3.1.0
#git clone https://github.com/tschoonj/xraylib
curl -O http://lvserver.ugent.be/xraylib/unstable/xraylib-3.99.0.tar.gz
tar xvfz xraylib-3.99.0.tar.gz
mv xraylib-3.99.0 xraylib
cd xraylib
#autoreconf -i 
mkdir build
cd build

../configure --enable-python --enable-python-integration PYTHON=$MYPYTHON --disable-libxrl
make
cp python/xraylib.py $PYTHON_SITE_PACKAGES 
cp python/.libs/*.so  $PYTHON_SITE_PACKAGES
#cp src/.libs/*.dylib  # for mac
#cp src/.libs/*.so  # for linux
cd ../..
echo "All done for xraylib. "
