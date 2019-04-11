

REM  install Anaconda 2018.2 in C:\anaconda3 (without VS, without PATH)
REM  Start->Anaconda3->Anaconda-Prompt

pip install numpy==1.16.0
pip install pyqt5==5.11.3
pip install hdf5plugin
pip install silx


mkdir soft-conda
cd soft-conda


git clone https://github.com/panosc-vinyl/orange-canvas
cd orange-canvas
pip install .
cd ..



git clone https://github.com/panosc-vinyl/orange-widget-core
cd orange-widget-core
pip install .
cd ..

pip install srxraylib
pip install syned
pip install wofry



git clone https://github.com/panosc-vinyl/oasys1
cd oasys1
pip install . --no-deps
cd ..





REM 
REM   try: python -m oasys.canvas -l4 --force-discovery
REM   Oasys should start (with no add-ons)
REM 
REM  If it works, use the install_addons_windows.bat file to install manually the addons
REM 
REM  ** IMPORTANT: DO NOT USE THE ADD-ONS MENU IN THE OASYS MENU -- DO NOT UPGRADE ADDONS USING THE OASYS MENU ***





