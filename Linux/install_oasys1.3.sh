#!/bin/bash

type git >/dev/null 2>&1 || ./aux_bin/check_git.sh
type git >/dev/null 2>&1 || exit 1

MINICONDA_HOME=$HOME/miniconda3
CUR_PATH=$(pwd)
AUX_PATH=$CUR_PATH/aux_bin

[ -d "${MINICONDA_HOME}" ] &&  {
    read -p "Delete or Rename previous Miniconda3 installation? ([D]/r)" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Rr]$ ]]
    then
        mv $MINICONDA_HOME $HOME/miniconda3_$(date +'%d-%m-%Y_%H.%M.%S')
    else
        rm -fR $MINICONDA_HOME
    fi
} || echo "Miniconda 3 not previously installed"

if [ $? -eq 0 ]; then echo ""; else exit 1; fi

if test -f "Miniconda3-py38_4.9.2-Linux-x86_64.sh"; then
    echo "Miniconda Installer already downloaded"
else
  echo "Downloading Miniconda Installer ..."
  wget https://repo.continuum.io/miniconda/Miniconda3-py38_4.9.2-Linux-x86_64.sh
  chmod +x Miniconda3-py38_4.9.2-Linux-x86_64.sh
fi

$CUR_PATH/Miniconda3-py38_4.9.2-Linux-x86_64.sh

if [ $? -eq 0 ]; then echo "Miniconda 3 installed. Installing Oasys"; else exit 1; fi

cd $MINICONDA_HOME/bin || exit 1
./python -m pip install pip --upgrade
./conda install -c conda-forge xraylib=3.3.0
./python -m pip uninstall numpy
./python -m pip install numpy==1.18.5 --upgrade
./python -m pip install fabio==0.11.0 --upgrade
./python -m pip install oasys1
cd - || exit 1

if [ $? -eq 0 ]; then echo "Oasys installed. Launching Oasys"; else exit 1; fi

$AUX_PATH/start_oasys.sh

read -p "Create Desktop Application (requires sudo grants)? ([Y]/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Nn]$ ]]
then
  echo "Installation completed"
else


  sudo $AUX_PATH/create_desktop_application.sh $AUX_PATH
  echo "Installation completed"
fi
