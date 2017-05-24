#!/bin/bash


echo "INSTALLING OASYS ON "
echo `lsb_release -rs`

sudo /home/oasys/miniconda3/bin/conda install pip
sudo /home/oasys/miniconda3/bin/conda install virtualenv
sudo /home/oasys/miniconda3/bin/conda install -c defaults pyqt=5 qt

# SCIPY
sudo apt-get -y install libblas-dev liblapack-dev libatlas-base-dev gfortran

# MATPLOTLIB
sudo apt-get -y install libfreetype6 libfreetype6-dev

# XRAYLIB
sudo apt-get -y install swig


