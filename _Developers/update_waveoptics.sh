#!/bin/bash

#===============================================================================
#
# script to install OASYS wave optics tools
#
# IMPORTANT: 
#
#   run this script from this directory: ./update_waveoptics.sh
#
#===============================================================================
#
#

# proxy 
# export all_proxy=http://proxy.esrf.fr:3128/


cd ..
# define python
#source oasys1env/bin/activate
source ~/.bashrc

########################################################
#
# WOFRY
#
########################################################

# oasys-syned
echo "Installing oasys-syned add-on"
pip uninstall oasys1-syned
rm -rf oasys-syned
git clone https://github.com/oasys-kit/oasys-syned
cd oasys-syned
pip install -e . --no-deps --no-binary :all:
cd ..

# oasys-wofry
echo "Installing oasys-wofry add-on"
pip uninstall oasys1-wofry
rm -rf oasys-wofry
git clone https://github.com/oasys-kit/oasys-wofry
cd oasys-wofry
pip install -e . --no-deps --no-binary :all:
cd ..

########################################################
#
# SRW
#
########################################################

# wofrysrw 
echo "Installing wofrysrw add-on"
pip uninstall wofrysrw
rm -rf wofrysrw
git clone https://github.com/oasys-kit/wofrysrw
cd wofrysrw
pip install -e . --no-deps --no-binary :all:
cd ..

# oasys-srw 
echo "Installing oasys-srw add-on"
pip uninstall oasys1-srw
rm -rf oasys-srw
git clone https://github.com/oasys-kit/oasys-srw
cd oasys-srw
#pip install -e . --no-deps --no-binary :all:
python setup.py sdist develop
cd ..

########################################################
#
# WISE
#
########################################################

# wiselib
echo "Installing Oasys add-on wiselib"
pip uninstall wiselib
rm -rf wiselib 
git clone https://github.com/lucarebuffi/wiselib
cd wiselib
pip install -e . --no-deps --no-binary :all:
cd ..

# wofrywise
echo "Installing Oasys add-on wofrywise"
pip uninstall wofrywise
rm -rf wofrywise 
git clone https://github.com/lucarebuffi/wofrywise
cd wofrywise
pip install -e . --no-deps --no-binary :all:
cd ..

# wise
echo "Installing Oasys add-on wise"
pip uninstall oasys1-wise
rm -rf wise 
git clone https://github.com/lucarebuffi/WISE.git wise
cd wise
pip install -e . --no-deps --no-binary :all:
cd ..

echo "All done. You can start Oasys with new add-ons using ../start_oasys.sh"
