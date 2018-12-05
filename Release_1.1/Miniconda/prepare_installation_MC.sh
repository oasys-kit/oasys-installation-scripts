#!/bin/bash

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh

echo "INSTALLING OASYS ON "
echo `lsb_release -rs`

$HOME/miniconda3/bin/conda install pip
$HOME/miniconda3/bin/conda install virtualenv
$HOME/miniconda3/bin/conda install -c defaults pyqt=5 qt

# SCIPY
sudo apt-get -y install libblas-dev liblapack-dev libatlas-base-dev gfortran

# MATPLOTLIB
sudo apt-get -y install libfreetype6 libfreetype6-dev

# XRAYLIB
sudo apt-get -y install swig


source ~/.bashrc


