#!/bin/bash

sudo apt-get remove python3-matplotlib
sudo apt-get remove python3-scipy
sudo apt-get remove python3-numpy

sudo apt-get install python3-pip
sudo pip3 install pip --upgrade

if [ `lsb_release -rs` == "14.04" ]; then
  echo "INSTALLING VIRTUAL ENV ON 14.04"
  sudo pip3 install virtualenv
  sudo apt-get install python3.4-venv
else
  if [ `lsb_release -rs` == "16.04" ]; then
    echo "INSTALLING VIRTUAL ENV ON 16.04"
    sudo apt-get install python3-virtualenv
    sudo apt install virtualenv
  fi
fi

sudo apt-get install python3-pyqt4

# SCIPY
sudo apt-get install libblas-dev liblapack-dev libatlas-base-dev gfortran

# MATPLOTLIB 
sudo apt-get install libfreetype6 libfreetype6-dev

# XRAYLIB
sudo apt-get install swig

# PYMCA
sudo apt-get install mesa-common-dev libgl1-mesa-dev freeglut3-dev

