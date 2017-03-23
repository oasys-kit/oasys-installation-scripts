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
rm -rf syned wofry oasys1 

#define python
source oasys1env/bin/activate

pip uninstall oasys

echo "Installing Oasys from github"
git clone https://github.com/lucarebuffi/oasys1
cd oasys1
python setup.py sdist develop
cd ..

echo "All done. "
