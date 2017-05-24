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

cd ..

#
# step 0: some local needs, like for ESRF proxy and clean all stuff
#

# proxy 
# export all_proxy=http://proxy.esrf.fr:3128/

# clean old stuff
echo "Cleaning old installation files..."
rm -rf =* shadow3 xraylib* pymca
# clean old virtual environment
rm -rf oasys1env


#
# step 1: create and start python3 virtual environment
#

virtualenv -p python3 --system-site-packages oasys1env
source oasys1env/bin/activate

#
# step 2: install Orange dependencies with pip (it can take a very very
# long time, in particular scipy)
#

echo "Installing Orange dependency numpy"
pip install --upgrade numpy>=1.9.0
echo "Installing Orange dependency scipy"
pip install --upgrade scipy>=0.17.0

#matplotlib
echo "Installing matplotlib"
pip install --upgrade matplotlib==1.4.3

# xraylib
echo "Installing Oasys dependency xraylib"
curl -O http://lvserver.ugent.be/xraylib/xraylib-3.2.0.tar.gz

tar xvfz xraylib-3.2.0.tar.gz
cd xraylib-3.2.0
./configure --enable-python --enable-python-integration PYTHON=`which python`
make
export PYTHON_SITE_PACKAGES=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
cp python/.libs/_xraylib.so  $PYTHON_SITE_PACKAGES
cp python/xrayhelp.py $PYTHON_SITE_PACKAGES
cp python/xraylib.py $PYTHON_SITE_PACKAGES
cp python/xraymessages.py  $PYTHON_SITE_PACKAGES
cd ..

#srxraylib
echo "Installing Oasys dependency srxraylib"
git clone https://github.com/lucarebuffi/srxraylib
cd srxraylib
python setup.py develop
cd ..

#shadow3
echo "Installing Oasys dependency shadow3"
git clone https://github.com/srio/shadow3
cd shadow3
python setup.py build
python setup.py develop
cd ..

#pymca
echo "Installing Oasys dependency pymca"
pip install fisx
git clone https://github.com/vasole/pymca
cd pymca
python setup.py install
cd ..

#
# step 4 install oasys
#
echo "Installing Oasys..."

pip install oasys

echo "All done. You can start Oasys using ./start_oasys.sh"
