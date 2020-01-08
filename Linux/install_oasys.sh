#!/bin/bash

type git >/dev/null 2>&1 || sudo ./check_git.sh

read -p "Delete or Rename previous Miniconda3 installation ? [D/r]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Rr]$ ]]
then
    mv $HOME/miniconda3 $HOME/miniconda3_$(date +'%d-%m-%Y_%H.%M.%S')
else
    rm -fR $HOME/miniconda3
fi

wget https://repo.continuum.io/miniconda/Miniconda3-4.7.12.1-Linux-x86_64.sh
chmod +x Miniconda3-4.7.12.1-Linux-x86_64.sh
./Miniconda3-4.7.12.1-Linux-x86_64.sh

cd $HOME/miniconda3/bin
./python -m pip install pip --upgrade
./conda install -c conda-forge xraylib=3.3.0
./python -m pip install oasys1
cd -

$HOME/miniconda3/bin/python -m oasys.canvas

sudo ./create_desktop_application.sh
