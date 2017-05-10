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
source oasys1env/bin/activate
export PYTHON_SITE_PACKAGES=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

echo "Cleaning old installation files..."
rm -rf xraylib
rm $PYTHON_SITE_PACKAGES/xrayhelp.py
rm $PYTHON_SITE_PACKAGES/xraylib.py
rm $PYTHON_SITE_PACKAGES/xraylib_np.so
rm $PYTHON_SITE_PACKAGES/_xraylib.so
rm $PYTHON_SITE_PACKAGES/xraymessages.py

# xraylib
echo "Installing Oasys dependency xraylib"
# curl -O http://lvserver.ugent.be/xraylib/xraylib-3.1.0.tar.gz
# tar xvfz xraylib-3.1.0.tar.gz
# cd xraylib-3.1.0
git clone https://github.com/tschoonj/xraylib
cd xraylib
autoreconf -i 

./configure --enable-python --enable-python-integration PYTHON=`which python`
make
cp python/xrayhelp.py $PYTHON_SITE_PACKAGES 
cp python/xraylib.py $PYTHON_SITE_PACKAGES 
cp python/.libs/_xraylib*.so  $PYTHON_SITE_PACKAGES
cp python/xraymessages.py  $PYTHON_SITE_PACKAGES 
cd ..
echo "All done for xraylib. "
