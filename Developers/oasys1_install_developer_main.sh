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
# step -1: some local needs, like for ESRF proxy and clean all stuff
#
# proxy 
export all_proxy=http://proxy.esrf.fr:3128/

#
# step 0 install python and qt from miniconda
#
cd ../Release\ 1.0
./prepare_installation.sh
# tell yes to create links in .bashrc then you can delete them
cd ..

# clean old stuff
echo "Cleaning old installation files..."
rm -rf =* shadow3 xraylib SRW syned silx srxraylib oasys1 Orange*
# clean old virtual environment
rm -rf oasys1env

#
# step 1: create and start python3 virtual environment
#
source ~/.bashrc
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
pip install numpy
pip install scipy
pip install matplotlib
# pip install silx




# xraylib
echo "Installing Oasys dependency xraylib"
$HOME/miniconda3/bin/conda install -c conda-forge xraylib=3.2.0


#
# step 3: install Orange dependencies with from sources
#


# SRW
echo "Installing Oasys dependency SRW"
./Developers/install_srw_from_github.sh

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
git checkout comsyl
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

#orange-canvas
echo "Installing Oasys dependency orange-canvas"
git clone https://github.com/lucarebuffi/orange-canvas
cd orange-canvas
python setup.py build
pip install . 
cd ..

#orange-widget-core
echo "Installing Oasys dependency orange-widget-core"
git clone https://github.com/lucarebuffi/orange-widget-core
cd orange-widget-core
python setup.py build
pip install . 
cd ..



#
# step 4 install oasys
#
echo "Installing Oasys..."
git clone https://github.com/lucarebuffi/oasys1
cd oasys1
python setup.py build
python setup.py develop
cd ..

echo "All done. You can start Oasys using ../start_oasys.sh"
