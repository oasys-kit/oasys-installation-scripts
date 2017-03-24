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


# define python
source oasys1env/bin/activate

# shadowOui
echo "Installing Oasys add-on shadowOui"
pip uninstall shadowOui
rm -rf shadowOui 
git clone https://github.com/lucarebuffi/shadowOui
cd shadowOui
pip install -e . --no-binary :all:
cd ..

# wise
echo "Installing Oasys add-on wise"
pip uninstall wise
rm -rf wise 
git clone https://github.com/lucarebuffi/WISE.git wise
cd wise
pip install -e . --no-binary :all:
cd ..

# xrayserver
echo "Installing Oasys add-on xrayserver"
pip uninstall xrayserver
rm -rf xrayserver 
git clone https://github.com/lucarebuffi/XRayServer xrayserver
cd xrayserver
pip install -e . --no-binary :all:
cd ..

# pySRU (needed in xoppy)
echo "Installing pySRU"
pip uninstall pySRU
rm -rf pySRU 
git clone https://github.com/srio/und_sophie_2016 pySRU
cd pySRU
pip install -e . --no-binary :all:
cd ..

# xoppy
echo "Installing Oasys add-on xoppy"
pip uninstall xoppy
rm -rf xoppy 
git clone https://github.com/srio/Orange-XOPPY xoppy
cd xoppy
pip install -e . --no-binary :all:
cd ..

#
# THESE ARE EXPERIMENTAL - INSTALL AT YOUR OWN RISK........
#

# # oasys-addon-template
# echo "Installing Oasys add-on oasys-addon-template"
# pip uninstall oasys-addon-template
# rm -rf oasys-addon-template 
# git clone https://github.com/srio/oasys-addon-template
# cd oasys-addon-template
# pip install -e . --no-binary :all:
# cd ..

# # oasys-dynXRD
# echo "Installing Oasys add-on oasys-dynXRD"
# pip uninstall dynXRD
# rm -rf dynXRD
# git clone https://github.com/suracefm/dynXRD
# cd dynXRD
# git checkout oasys
# pip install -e . --no-binary :all:
# cd ..
# pip uninstall oasysdynXRD
# rm -rf oasys-dynXRD
# git clone https://github.com/suracefm/oasys-dynXRD oasys-dynXRD
# cd oasys-dynXRD
# pip install -e . --no-binary :all:
# cd ..

# # oasys-crystalpy
# echo "Installing Oasys add-on oasys-crystalpy"
# pip uninstall crystalpy
# rm -rf crystalpy
# git clone https://github.com/edocappelli/crystalpy
# cd crystalpy
# pip install -e . --no-binary :all:
# cd ..
# pip uninstall oasyscrystalpy
# rm -rf oasys-crystalpy
# git clone https://github.com/edocappelli/oasys-crystalpy oasys-crystalpy
# cd oasys-crystalpy
# pip install -e . --no-binary :all:
# cd ..

echo "All done. You can start Oasys with new add-ons using ./start_oasys.sh"
