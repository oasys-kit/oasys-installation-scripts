@echo off

pip install pip --upgrade
cmd /c conda install -c conda-forge xraylib=3.3.0
cmd /c conda install git
pip install oasys1 --upgrade
python -m oasys.canvas -l4




