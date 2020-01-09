@echo off

pip install pip --upgrade
cmd /c conda install -c conda-forge xraylib=3.3.0
pip install oasys1
python -m oasys.canvas -l4




