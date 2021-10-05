@echo off

pip install pip --upgrade
cmd /c conda install git
cmd /c conda install -c conda-forge xraylib=3.3.0
pip uninstall -y numpy
pip install numpy==1.18.5 --upgrade
pip install fabio==0.11.0 --upgrade
pip install oasys1 --upgrade
python -m oasys.canvas -l4




