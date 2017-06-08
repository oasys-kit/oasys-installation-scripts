#!/bin/bash

#===============================================================================
#
# script to install OASYS Experimental add-ons from github sources  
#
#===============================================================================
#
#

# proxy 
export all_proxy=http://proxy.esrf.fr:3128/


cd ..
# define python
source oasys1env/bin/activate

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
# pip uninstall oasys-crystalpy
# rm -rf oasys-crystalpy
# git clone https://github.com/edocappelli/oasys-crystalpy 
# cd oasys-crystalpy
# pip install -e . --no-binary :all:
# cd ..


# oasys-crystalpy
echo "Installing Oasys add-on wofryshadow"
pip uninstall wofryshadow
rm -rf wofryshadowrystalpy
git clone https://github.com/srio/wofryshadow
cd wofryshadow
pip install -e . --no-binary :all:
cd ..

echo "All done. You can start Oasys with new add-ons using ../start_oasys.sh"
