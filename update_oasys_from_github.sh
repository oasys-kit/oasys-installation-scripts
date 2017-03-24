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
rm -rf oasys1 

#define python
source oasys1env/bin/activate

pip uninstall oasys
pip uninstall orange-widget-core
pip uninstall orange-canvas-core

pip install 'orange-widget-core>=0.0,<0.1'
pip install 'orange-canvas-core>=0.0.7,<0.1'

echo "Installing Oasys from github"
git clone https://github.com/lucarebuffi/oasys1
cd oasys1
pip install -e . --no-binary :all:
cd ..

echo "All done. "
