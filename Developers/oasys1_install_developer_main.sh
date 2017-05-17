#!/bin/bash

#===============================================================================
#
# script to install OASYS1 in a LINUX virtual environment in developer mode 
# (downloading from sources) (sudo is not required)
#
# Before starting make sure that your system has installed: 
#      - python3
#      - virtualenv
#      - qt and pyqt
#   If any of these items is not present in your system, contact the
#   system administrator and ask for their installation.     pip install 'orange-widget-core>=0.0,<0.1'
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
rm -rf =* shadow3 xraylib SRW syned silx srxraylib oasys1 Orange*
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

echo "Upgrading some tools"
pip install --upgrade pip 


echo "Installing Orange dependency numpy"
pip install numpy
echo "Installing Orange dependency scipy"
pip install scipy

#matplotlib
echo "Installing matplotlib"
pip install matplotlib

#
# step 3: install Orange dependencies with from sources
#

# xraylib
echo "Installing Oasys dependency xraylib"
./install_xraylib_from_github.sh

# SRW
echo "Installing Oasys dependency SRW"
./install_srw_from_github.sh

#shadow3
echo "Installing Oasys dependency shadow3"
git clone https://github.com/srio/shadow3
cd shadow3
python setup.py build
#pip install --no-deps -e . --no-binary :all:
python setup.py develop
cd ..

#srxraylib
echo "Installing Oasys dependency srxraylib"
git clone https://github.com/lucarebuffi/srxraylib
cd srxraylib
#pip install --no-deps -e . --no-binary :all:
python setup.py develop
cd ..

#syned
echo "Installing Oasys dependency syned"
git clone https://github.com/lucarebuffi/syned
cd syned
python setup.py build
#pip install --no-deps -e . --no-binary :all:
python setup.py develop
cd ..

#wofry
echo "Installing Oasys dependency wofry"
git clone https://github.com/lucarebuffi/wofry
cd wofry
python setup.py build
#pip install --no-deps -e . --no-binary :all:
python setup.py develop
cd ..

#silx
echo "Installing Oasys dependency silx"
git clone https://github.com/silx-kit/silx
cd silx
python setup.py build
pip install . 
cd ..

# #orange-canvas-core
pip install 'orange-canvas-core>=0.0.7,<0.1'

# echo "Installing Oasys dependency orange-canvas-core"
# curl -O https://pypi.python.org/packages/13/9b/9dfc5933a15d2c90eb78a1bd3b1ad040e6a11569481d7048768490ff7a1e/Orange-Canvas-Core-0.0.7.tar.gz
# tar xvfz Orange-Canvas-Core-0.0.7.tar.gz
# cd Orange-Canvas-Core-0.0.7
# python setup.py build
# pip install .
# cd ..

# #orange-widget-core
pip install 'orange-widget-core>=0.0,<0.1'
# echo "Installing Oasys dependency orange-widget-core"
# curl -O https://pypi.python.org/packages/54/53/2426a247fc138bbcdbd5a7b9438026799eec2a322d386c3eaa4e15b1db37/Orange-Widget-Core-0.0.2.tar.gz
# tar xvfz Orange-Widget-Core-0.0.2.tar.gz
# cd Orange-Widget-Core-0.0.2
# python setup.py build
# pip install .
# cd ..
#
# step 4 install oasys
#
echo "Installing Oasys..."
git clone https://github.com/lucarebuffi/oasys1
cd oasys1
python setup.py build
python setup.py develop
#pip install --no-deps -e . --no-binary :all:

echo "All done. You can start Oasys using ./start_oasys.sh"
