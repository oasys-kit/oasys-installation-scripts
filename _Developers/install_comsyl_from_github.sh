#!/bin/bash

#===============================================================================
#
# script to update/install comsyl in oasys environment
#
# srio@esrf.eu
#
# IMPORTANT: Run it from the current directory
#
#  ./Developer/install_comsyl_from_github.sh
#
#===============================================================================
#
#

# export all_proxy=http://proxy.esrf.fr:3128/


#define python
source $HOME/OASYS1.1d/define_environment.sh

#export PYTHON_SITE_PACKAGES=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

# comsyl
echo "Installing Oasys dependency comsyl"

# PETSC and SLEPC

conda install -c conda-forge petsc
conda install  -c conda-forge petsc4py

conda install -c conda-forge slepc
conda install -c conda-forge slepc4py

conda install -c conda-forge mpi4py

cd ..

# clean old stuff
rm -rf comsyl
git clone https://github.com/mark-glass/comsyl
cd comsyl

python -m pip install -e . --no-deps --no-binary :all:

echo "All done for COMSYL. "
pwd
