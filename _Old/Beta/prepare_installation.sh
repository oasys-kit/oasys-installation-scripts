#!/bin/bash

if [ `lsb_release -rs` == "16.10" ]
then
  echo "INSTALLING OASYS ON 16.10 IS NOT POSSIBLE: TRY 16.04"
else
  echo "INSTALLING OASYS"
  #sudo apt-get remove python3-matplotlib
  #sudo apt-get remove python3-scipy
  #sudo apt-get remove python3-numpy

  sudo apt-get -y install python3-pip
  sudo pip3 install pip --upgrade

  if [ `lsb_release -rs` == "14.04" ]
  then
    echo "INSTALLING VIRTUAL ENV ON 14.04"
    sudo pip3 install virtualenv
    sudo apt-get -y install python3.4-venv
  fi

  if [ `lsb_release -rs` == "16.04" ]
  then
    echo "INSTALLING VIRTUAL ENV ON 16.04"
    sudo apt-get -y install python3-virtualenv
    sudo apt -y install virtualenv
  fi

  sudo apt-get -y install python3-pyqt4

  # SCIPY
  sudo apt-get -y install libblas-dev liblapack-dev libatlas-base-dev gfortran

  # MATPLOTLIB
  sudo apt-get -y install libfreetype6 libfreetype6-dev

  # XRAYLIB
  sudo apt-get -y install swig

  # PYMCA
  sudo apt-get -y install mesa-common-dev libgl1-mesa-dev freeglut3-dev

fi
