

REM  install Anaconda 2018.2 in C:\anaconda3 (without VS, without PATH)
REM  Start->Anaconda3->Anaconda-Prompt

pip install numpy==1.16.0

pip install pyqt5==5.11.3

pip install hdf5plugin

pip install silx


#pip install srxraylib

# for the moment oasys1-srwpy 1.0.2 is not available for windows, so use older version

pip install https://files.pythonhosted.org/packages/08/6e/34d810ca5acfbab9850ed887dc9362683f4dc895aa9e7da543d7a072d121/oasys_srwpy-1.0.0-cp37-cp37m-win_amd64.whl

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






