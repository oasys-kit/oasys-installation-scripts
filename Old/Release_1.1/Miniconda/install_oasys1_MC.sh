#!/bin/bash

#===============================================================================
#
# script to install OASYS in a LINUX Miniconda3 environment 
# (sudo is not required)
#
#
# Before starting, run the script "prepare_installation_MC.sh".
#
# Then run this script automatically (it may take a very long time) or 
# manually by copy/paste line by line, if you want to detect possible errors. 
#

# Note that the script changes directory to the main installation directory. 
#
# Then start oasys by:
#   python -m oasys.canvas -l4 --force-discovery
# or
#   ./start_oasys.sh
#
#===============================================================================
#
#

#
# step 0: some local needs, like for ESRF proxy and clean all stuff
#

# proxy 
#export all_proxy=http://proxy.esrf.fr:3128/

cd ../..

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh

# Note that by default miniconda3 directory is installed in the home directory ~/miniconda3
# If wanted, you can define another working directory. 
./Miniconda3-latest-Linux-x86_64.sh

# copy start_oasys_MC.sh to .. and customize them if necessary

cp  Release_1.1/Miniconda/start_oasys.sh .

source ./define_environment.sh

# xraylib
echo "Installing Oasys dependency xraylib"
conda install -c conda-forge xraylib=3.3.0

# Qt specific version 5.11.3

pip install pyqt5==5.11.3

#
# step 4 install oasys
#
echo "Installing Oasys..."

pip install oasys1

echo "All done. You can start Oasys using start_oasys.sh and install add-ons from the Options in the menu"  
