@echo off

pip uninstall -y pip setuptools && curl -s https://bootstrap.pypa.io/get-pip.py | python

cmd /c conda install git
cmd /c conda install -c conda-forge xraylib=3.3.0
pip install oasys1 --upgrade

pip install numba --upgrade
pip uninstall -y oasys-srwpy
pip install oasys-srwpy --upgrade
pip install PyQtWebEngine==5.15.2 --upgrade

python -m oasys.canvas -l4




