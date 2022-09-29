@echo off

pip install pip --upgrade
cmd /c conda install git
cmd /c conda install -c conda-forge xraylib=4.1.2
pip install oasys1 --upgrade

python -m oasys.canvas -l4




