#!/bin/bash

#===============================================================================
#
# script to install update OASYS 
#
#===============================================================================
#
#


# clean old stuff
echo "Cleaning old installation files..."
rm -rf oasys1 shadow3 srxraylib shadowOui 

#define python
source oasys1env/bin/activate

#SRxraylib
echo "Installing Oasys dependency SRxraylib"
git clone https://github.com/lucarebuffi/srxraylib
cd srxraylib
python setup.py install
cd ..

#shadow3
echo "Installing Oasys dependency shadow3"
git clone https://github.com/srio/shadow3
cd shadow3
python setup.py build
python setup.py develop
cd ..

# oasys 
echo "Installing Oasys..."
git clone https://github.com/lucarebuffi/oasys1
cd oasys1
python setup.py develop
cd ..

# shadowOui
echo "Installing ShadowOui"
git clone https://github.com/lucarebuffi/shadowOui
cd shadowOui
python setup.py develop
cd ..

echo "All done. You can start Oasys+ShadowOui using ./start_oasys.sh"
