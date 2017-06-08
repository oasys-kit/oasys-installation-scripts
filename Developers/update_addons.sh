#!/bin/bash

#===============================================================================
#
# script to install OASYS add-ons from github sources  
#
#===============================================================================
#
#

# proxy 
# export all_proxy=http://proxy.esrf.fr:3128/


cd ..
# define python
source oasys1env/bin/activate

# shadowOui
echo "Installing Oasys add-on shadowOui"
pip uninstall shadowOui
rm -rf shadowOui 
git clone https://github.com/lucarebuffi/shadowOui
cd shadowOui
#pip install -e . --no-binary :all:
python setup.py develop
cd ..

# # wise
# echo "Installing Oasys add-on wise"
# pip uninstall wise
# rm -rf wise 
# git clone https://github.com/lucarebuffi/WISE.git wise
# cd wise
# pip install -e . --no-binary :all:
# cd ..
# 
# # xrayserver
# echo "Installing Oasys add-on xrayserver"
# pip uninstall xrayserver
# rm -rf xrayserver 
# git clone https://github.com/lucarebuffi/XRayServer xrayserver
# cd xrayserver
# pip install -e . --no-binary :all:
# cd ..
# 
# pySRU (needed in xoppy)
echo "Installing pySRU"
pip uninstall pySRU
rm -rf pySRU 
git clone https://github.com/srio/und_sophie_2016 pySRU
cd pySRU
#pip install -e . --no-binary :all:
python setup.py develop
cd ..
# 
# xoppy
echo "Installing Oasys add-on xoppy"
pip uninstall xoppy
rm -rf xoppy 
git clone https://github.com/srio/Orange-XOPPY xoppy
cd xoppy
#pip install -e . --no-binary :all:
python setup.py develop
cd ..

echo "All done. You can start Oasys with new add-ons using ../start_oasys.sh"
