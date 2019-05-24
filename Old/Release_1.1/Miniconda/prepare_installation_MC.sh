#!/bin/bash

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh

echo "INSTALLING OASYS ON "
echo `lsb_release -rs`

$HOME/miniconda3/bin/conda install pip

# SCIPY
sudo apt-get -y install libblas-dev liblapack-dev libatlas-base-dev gfortran

# MATPLOTLIB
sudo apt-get -y install libfreetype6 libfreetype6-dev

# XRAYLIB
sudo apt-get -y install swig

$HOME/miniconda3/bin/python3 -m pip install numpy --upgrade
$HOME/miniconda3/bin/python3 -m pip install scipy --upgrade
$HOME/miniconda3/bin/python3 -m pip install matplotlib --upgrade
$HOME/miniconda3/bin/python3 -m pip install sip --upgrade
$HOME/miniconda3/bin/python3 -m pip install PyQt5 --upgrade
$HOME/miniconda3/bin/python3 -m pip install PyQt5-sip --upgrade

