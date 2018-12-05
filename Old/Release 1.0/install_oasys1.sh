#!/bin/bash

#===============================================================================
#
# script to install OASYS in a LINUX Miniconda3 environment (sudo is not required)
#
# Before starting make sure that your system has installed: 
#      - python3
#      - qt and pyqt
#   If any of these items is not present in your system, contact the
#   system administrator and ask for their installation.     
#
# To be sure, run the script "prepare_installation.sh".
#
# Then place this script in a suitable directory (e.g., $HOME/OASYS_VE) and run
# this script automatically (it may take a very long time) or manually by
# copy/paste line by line, if you want to detect possible errors). 
#
# Then start oasys by:
#   ~/miniconda3/bin/python3 -m oasys.canvas -l4 --force-discovery
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

# CORRECTING BUG IN SETUPTOOLS!!!!!!
$HOME/miniconda3/bin/python3 -m pip uninstall -y setuptools
$HOME/miniconda3/bin/python3 -m pip install setuptools==34.3.0

# xraylib
echo "Installing Oasys dependency xraylib"
$HOME/miniconda3/bin/python3 -m pip install numpy
$HOME/miniconda3/bin/conda install -c conda-forge xraylib=3.2.0


#
# step 4 install oasys
#
echo "Installing Oasys..."

$HOME/miniconda3/bin/python3 -m pip install oasys1

echo "All done. You can start Oasys using ../start_oasys.sh"
