#!/bin/bash

#===============================================================================
#
# script to update OASYS most important dependencies
#
#===============================================================================
#
#
# proxy 
# export all_proxy=http://proxy.esrf.fr:3128/

# clean old stuff
echo "Cleaning old installation files..."
rm -rf oasys1 shadow3 srxraylib 

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
pip install oasys --upgrade

echo "All done. You can start Oasys+ShadowOui using ./start_oasys.sh"
