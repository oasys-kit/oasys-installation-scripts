#!/bin/bash

rm -fR $HOME/miniconda3

wget https://repo.continuum.io/miniconda/Miniconda3-4.7.12.1-Linux-x86_64.sh
chmod +x Miniconda3-4.7.12.1-Linux-x86_64.sh
./Miniconda3-4.7.12.1-Linux-x86_64.sh

cd $HOME/miniconda3/bin
./python -m pip install pip --upgrade
./conda install -c conda-forge xraylib=3.3.0
./python -m pip install oasys1
cd -

$HOME/miniconda3/bin/python -m oasys.canvas
