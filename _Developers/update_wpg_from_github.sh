#!/bin/bash

#===============================================================================
#
# script to update/install wpg from github in linux
#
#===============================================================================
#
#

# export all_proxy=http://proxy.esrf.fr:3128/

# clean old stuff

#define python
source oasys1env/bin/activate
export PYTHON_SITE_PACKAGES=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

echo "Cleaning old installation files..."
rm -rf wpg
rm -r $PYTHON_SITE_PACKAGES/wpg

# wpg
echo "Installing Oasys dependency wpg"
git clone https://github.com/srio/wpg
cd wpg
pip install -e . --no-binary :all:
cd ..
echo "All done. "
