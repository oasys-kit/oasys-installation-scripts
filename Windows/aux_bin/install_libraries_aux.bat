@echo off

python -m pip install pip --upgrade
cmd /c conda install git
cmd /c conda install -c conda-forge xraylib=3.3.0
pip install oasys1 --upgrade
python -m oasys.canvas -l4




