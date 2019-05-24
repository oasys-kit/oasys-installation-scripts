#!/bin/bash

#===============================================================================
#
# script to install OASYS in a LINUX virtual environment (sudo is not required)
#
# Before starting make sure that your system has installed: 
#      - python3
#      - virtualenv
#      - qt and pyqt
#   If any of these items is not present in your system, contact the
#   system administrator and ask for their installation.     
#   
# Then place this script in a suitable directory (e.g., $HOME/OrangeVE) and run 
# this script automatically (it may take a very ling time) or manually by 
# copy/paste line by line, if you want to detect possible errors). 
#
# Then start oasys by:
#   source ./oasys1env/bin/activate
#   python -m oasys.canvas -l4 --force-discovery
#
#===============================================================================
#
#

#
# step 0: some local needs, like for ESRF proxy and clean all stuff
#

# proxy 
#export all_proxy=http://proxy.esrf.fr:3128/

# clean old stuff
echo "Cleaning old installation files..."
rm -rf =* xraylib* 
# clean old virtual environment
rm -rf ~/oasys1env

#
# step 1: create and start python3 virtual environment
#

virtualenv --system-site-packages ~/oasys1env
source ~/oasys1env/bin/activate

pip install resources --upgrade
pip install numpy --upgrade
pip install scipy --upgrade
pip install matplotlib --upgrade

# xraylib
echo "Installing Oasys dependency xraylib"
curl -O http://lvserver.ugent.be/xraylib/xraylib-3.3.0.tar.gz

tar xvfz xraylib-3.3.0.tar.gz
cd xraylib-3.3.0
./configure --enable-python --enable-python-integration PYTHON=`which python`
make

export PYTHON_SITE_PACKAGES=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
echo $PYTHON_SITE_PACKAGES

cp python/.libs/_xraylib*.so  $PYTHON_SITE_PACKAGES
cp python/xrayhelp.py $PYTHON_SITE_PACKAGES
cp python/xraylib.py $PYTHON_SITE_PACKAGES
cp python/xraymessages.py  $PYTHON_SITE_PACKAGES

mkdir ~/oasys1env/lib/xraylib
cp src/.libs/libxrl.so* ~/oasys1env/lib/xraylib

cd ..

rm -fR xraylib-3.3.0*

#
# step 4 install oasys
#
echo "Installing Oasys..."

pip install oasys1

echo "All done. You can start Oasys using ../../start_oasys_VE.sh"
