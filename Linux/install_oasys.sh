#!/bin/bash

type git >/dev/null 2>&1 || ./check_git.sh

minicondadir=$HOME/miniconda3

[ -d "${minicondadir}" ] &&  {
    read -p "Delete or Rename previous Miniconda3 installation? ([D]/r)" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Rr]$ ]]
    then
        mv $minicondadir $HOME/miniconda3_$(date +'%d-%m-%Y_%H.%M.%S')
    else
        rm -fR $minicondadir
    fi
}

wget https://repo.continuum.io/miniconda/Miniconda3-4.7.12.1-Linux-x86_64.sh
chmod +x Miniconda3-4.7.12.1-Linux-x86_64.sh
./Miniconda3-4.7.12.1-Linux-x86_64.sh

cd $minicondadir/bin
./python -m pip install pip --upgrade
./conda install -c conda-forge xraylib=3.3.0
./python -m pip install oasys1
cd -

./start_oasys.sh

read -p "Create Desktop Application (requires sudo grants)? ([Y]/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Nn]$ ]]
then
  echo "Installation completed"
else
  sudo ./create_desktop_application.sh
  echo "Installation completed"
fi
