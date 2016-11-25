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
rm -rf shadowOui 
git clone https://github.com/lucarebuffi/shadowOui
cd shadowOui
python setup.py sdist develop
cd ..

# wise
echo "Installing Oasys add-on wise"
rm -rf wise 
git clone https://github.com/lucarebuffi/WISE.git wise
cd wise
python setup.py develop
cd ..

# xrayserver
echo "Installing Oasys add-on xrayserver"
rm -rf xrayserver 
git clone https://github.com/lucarebuffi/XRayServer xrayserver
cd xrayserver
python setup.py develop
cd ..

# pySRU (needed in xoppy)
echo "Installing pySRU"
rm -rf pySRU 
git clone https://github.com/sophieth/und_sophie_2016 pySRU
cd pySRU
python setup.py develop
cd ..

# xoppy
echo "Installing Oasys add-on xoppy"
rm -rf xoppy 
git clone https://github.com/srio/Orange-XOPPY xoppy
cd xoppy
python setup.py develop
cd ..

#
# THESE ARE EXPERIMENTAL - INSTALL AT YOUR OWN RISK........
#

# crystal
echo "Installing Oasys add-on crystal"
rm -rf crystal 
git clone https://github.com/mark-glass/Orange-Crystal crystal
cd crystal
python setup.py develop
cd ..

echo "All done. You can start Oasys with new add-ons using ./start_oasys.sh"
