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



if test -f "Miniconda3-py37_4.10.3-Linux-x86_64.sh"; then
    echo "Miniconda Installer already downloaded"
else
  echo "Downloading Miniconda Installer ..."
  wget https://repo.continuum.io/miniconda/Miniconda3-py37_4.10.3-Linux-x86_64.sh
  chmod +x Miniconda3-py37_4.10.3-Linux-x86_64.sh
fi

$CUR_PATH/Miniconda3-py37_4.10.3-Linux-x86_64.sh

if [ $? -eq 0 ]; then
  echo "Miniconda 3 installed. Activating it..."
  if test -f "$HOME/.bashrc_oasys"; then
    cp -f $HOME/.bashrc $HOME/.bashrc_oasys_2
    echo "~/.bashrc copied into ~/.bashrc_oasys_2"
  else
    cp -f $HOME/.bashrc $HOME/.bashrc_oasys
    echo "~/.bashrc copied into ~/.bashrc_oasys"
  fi
  $MINICONDA_HOME/bin/conda init bash
  source $HOME/.bashrc
  conda activate $MINICONDA_HOME
  echo "Installing Oasys..."
else
  exit 1
fi

cd $MINICONDA_HOME/bin || exit 1
./python -m pip install pip --upgrade
./conda install -c conda-forge xraylib=4.1.2
./python -m pip install oasys1
cd - || exit 1

if [ $? -eq 0 ]; then echo "Oasys installed. Launching Oasys"; else exit 1; fi

#sudo sudo apt install qt5-style-plugins || sudo yum install qt5-style-plugins

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
