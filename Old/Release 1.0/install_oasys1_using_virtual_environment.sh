#!/bin/bash

#===============================================================================
#
# script to install OASYS in a LINUX virtual environment (sudo is not required)
#
# Before starting make sure that your system has installed: 
#      - python3
#      - virtualenv
#      - qt and pyqt
#   If any of these items is not present in your system, contact the
#   system administrator and ask for their installation.     
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

cd ..

#
# step 0: some local needs, like for ESRF proxy and clean all stuff
#

# proxy 
#export all_proxy=http://proxy.esrf.fr:3128/

# clean old stuff
echo "Cleaning old installation files..."
rm -rf =* xraylib* 
# clean old virtual environment
rm -rf oasys1env

#
# step 1: create and start python3 virtual environment
#

$HOME/miniconda3/bin/virtualenv -p python3 --system-site-packages oasys1env
source oasys1env/bin/activate

# CORRECTING BUG IN SETUPTOOLS!!!!!!
pip uninstall -y setuptools
pip install setuptools==34.3.0

# xraylib
echo "Installing Oasys dependency xraylib"
pip install numpy
$HOME/miniconda3/bin/conda install -c conda-forge xraylib=3.2.0


#
# step 4 install oasys
#
echo "Installing Oasys..."

pip install oasys1

echo "All done. You can start Oasys using ../start_oasys.sh"
