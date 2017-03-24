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
# export all_proxy=http://proxy.esrf.fr:3128/

# clean old stuff
echo "Cleaning old installation files..."
rm -rf =* shadow3 xraylib* srxraylib syned wofry
# clean old virtual environment
rm -rf oasys1env


#
# step 1: create and start python3 virtual environment
#

virtualenv -p python3  --system-site-packages oasys1env
source oasys1env/bin/activate

pip install --upgrade pip
pip install --upgrade setuptools
pip install --upgrade wheel

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
pip install http://ftp.esrf.eu/pub/scisoft/Oasys/pip/xraylib-3.1.tar.gz

#srxraylib
echo "Installing Oasys dependency srxraylib"
git clone https://github.com/lucarebuffi/srxraylib
cd srxraylib
pip install -e . --no-binary :all:
cd ..

#shadow3
echo "Installing Oasys dependency shadow3"
git clone https://github.com/srio/shadow3
cd shadow3
python setup.py build
pip install -e . --no-binary :all:
cd ..

#silx
echo "Installing Oasys dependency silx"
pip install silx

echo "Installing Oasys dependency syned"
git clone https://github.com/lucarebuffi/syned
cd syned
pip install -e . --no-binary :all:
cd ..

echo "Installing Oasys dependency wofry"
git clone https://github.com/lucarebuffi/wofry
cd wofry
pip install -e . --no-binary :all:
cd ..

#
# step 4 install oasys
#
echo "Installing Oasys..."

pip install 'orange-widget-core>=0.0,<0.1'
pip install 'orange-canvas-core>=0.0.7,<0.1'

echo "Installing Oasys from github"
git clone https://github.com/lucarebuffi/oasys1
cd oasys1
pip install -e . --no-binary :all:
cd ..

echo "All done. "
echo "All done. You can start Oasys using ./start_oasys.sh"
