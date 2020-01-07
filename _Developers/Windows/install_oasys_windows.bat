

REM  install Anaconda 2018.2 in C:\anaconda3 (without VS, without PATH)
REM  Start->Anaconda3->Anaconda-Prompt

pip install numpy==1.16.0

pip install pyqt5==5.11.3

pip install hdf5plugin

pip install silx

pip install srxraylib

pip install syned

pip install wofry

pip install oasys-canvas-core

pip install oasys-widget-core

pip install oasys1

conda install -c conda-forge xraylib=3.3.0


REM 
REM   try: python -m oasys.canvas -l4 --force-discovery
REM   Oasys should start (with no add-ons)
REM 
REM  Use the Optioons->AddOns to install the addons from the Oasys menu bar






