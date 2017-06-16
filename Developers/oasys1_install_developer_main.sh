#!/bin/bash


#===============================================================================
#
# script to install OASYS in a LINUX virtual environment in DEVELOPER mode 
# (downloading from sources) (sudo is not required)
#
# IMPORTANT: 
#
#   run this script from this directory: ./oasys1_install_developer_main.sh
#
# Then start oasys by:
#   cd ..
#   source ./oasys1env/bin/activate
#   python -m oasys.canvas -l4 --force-discovery
#
#===============================================================================
#
#


#
# step -1: some local needs, like for ESRF proxy and clean all stuff
#
# proxy 
# export all_proxy=http://proxy.esrf.fr:3128/

#
# step 0 if not already done (e,g, you did not make the linux non-developer
# installation), uncomment this section for installing python and qt 
# from miniconda
#

# cd ../Release\ 1.0
# ./prepare_installation.sh
# # tell yes to create links in .bashrc then you can delete them

# sits in the main VE directory
cd ..

# clean old stuff
echo "Cleaning old installation files..."
rm -rf =* shadow3 SRW syned wofry silx srxraylib oasys1 orange-canvas orange-widget-core
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
# CORRECTING BUG IN SETUPTOOLS!!!!!!
pip uninstall -y setuptools
pip install setuptools==34.3.0
pip install scipy
pip install matplotlib


#
# step 3: install Oasys dependencies with from sources
#


# SRW
echo "Installing Oasys dependency SRW"
./Developers/install_srw_from_github.sh

#shadow3
echo "Installing Oasys dependency shadow3"
git clone https://github.com/srio/shadow3
cd shadow3
python setup.py build
pip install --no-deps -e . --no-binary :all:
cd ..

#srxraylib
echo "Installing Oasys dependency srxraylib"
git clone https://github.com/lucarebuffi/srxraylib
cd srxraylib
pip install --no-deps -e . --no-binary :all:
cd ..

#syned
echo "Installing Oasys dependency syned"
git clone https://github.com/lucarebuffi/syned
cd syned
git checkout comsyl
python setup.py build
pip install --no-deps -e . --no-binary :all:
cd ..

#wofry
echo "Installing Oasys dependency wofry"
git clone https://github.com/lucarebuffi/wofry
cd wofry
python setup.py build
pip install --no-deps -e . --no-binary :all:
cd ..

#silx
echo "Installing Oasys dependency silx"
# git clone https://github.com/silx-kit/silx
# cd silx
# python setup.py build
# pip install . 
# cd ..
pip install silx

#orange-canvas
echo "Installing Oasys dependency oasys-canvas"
git clone https://github.com/lucarebuffi/orange-canvas oasys-canvas
cd oasys-canvas
python setup.py build
pip install . 
cd ..
#pip install oasys-canvas-core

#orange-widget-core
echo "Installing Oasys dependency oasys-widget-core"
git clone https://github.com/lucarebuffi/orange-widget-core oasys-widget-core
cd oasys-widget-core
python setup.py build
pip install . 
cd ..
#pip install oasys-widget-core


#
# step 4 install oasys
#
echo "Installing Oasys..."
git clone https://github.com/lucarebuffi/oasys1
cd oasys1
python setup.py build
python setup.py develop
cd ..
#pip install oasys1

echo "All done. You can start Oasys using ../start_oasys.sh"
