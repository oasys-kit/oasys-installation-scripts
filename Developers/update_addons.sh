#!/bin/bash

#===============================================================================
#
# script to install OASYS official add-ons from github sources  
#
# IMPORTANT: 
#
#   run this script from this directory: ./update_addons.sh
#
#===============================================================================
#
#

# proxy 
# export all_proxy=http://proxy.esrf.fr:3128/


cd ..
# define python
source oasys1env/bin/activate

# wofryshadow
echo "Installing Oasys add-on wofryshadow"
pip uninstall wofryshadow
rm -rf wofryshadow 
git clone https://github.com/srio/wofryshadow
cd wofryshadow
pip install -e . --no-deps --no-binary :all:
cd ..

# shadowOui
echo "Installing Oasys add-on shadowOui"
pip uninstall shadowOui
rm -rf shadowOui 
git clone https://github.com/lucarebuffi/shadowOui
cd shadowOui
pip install -e . --no-deps --no-binary :all:
python setup.py develop
cd ..

# pySRU (needed in xoppy)
echo "Installing pySRU"
pip uninstall pySRU
rm -rf pySRU 
git clone https://github.com/srio/und_sophie_2016 pySRU
cd pySRU
python setup.py build
pip install -e . --no-deps --no-binary :all:
cd ..

# xoppy

##todo install oasys1-srwlib
echo "Installing Oasys add-on xoppy"
pip uninstall xoppy
rm -rf xoppy 
git clone https://github.com/srio/Orange-XOPPY xoppy
cd xoppy
python setup.py build
pip install -e . --no-deps --no-binary :all:
cd ..

echo "All done. You can start Oasys with new add-ons using ../start_oasys.sh"
