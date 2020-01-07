REM 
REM  Before using this bat file, Oasys must be installed (see install_oasys_windows.bat) 
REM  try: python -m oasys.canvas -l4 --force-discovery
REM  Oasys should start (with no add-ons)
REM 
REM 
REM  ** IMPORTANT: DO NOT USE THE ADD-ONS MENU IN THE OASYS MENU -- DO NOT UPGRADE ADDONS USING THE OASYS MENU ***
REM 


REM 
REM  install manually add-ons [check each one before continuing...]
REM 


REM 
REM  syned and wofry widgets
REM 
pip install oasys1-syned --no-deps
pip install oasys1-wofry --no-deps


REM 
REM  install srwlib
REM 
pip install vinyl-srw


REM 
REM  install xraylib (to do: answer yes)
REM 

conda install -c conda-forge xraylib=3.3.0


REM 
REM  install xoppy
REM 
pip install pySRU

git clone https://github.com/panosc-vinyl/xoppy
cd xoppy
pip install . --no-deps
cd ..

REM 
REM  install srw
REM 

git clone https://github.com/panosc-vinyl/wofrysrw
cd wofrysrw
pip install . --no-deps
cd ..

git clone https://github.com/panosc-vinyl/oasys-srw
cd oasys-srw
pip install . --no-deps
cd ..


REM 
REM  shadow 
REM 

pip install shadow3 --no-deps
pip install wofryshadow --no-deps
pip install oasys1-shadowoui  --no-deps


REM 
REM  wiser
REM 

pip install wiselib2 --no-deps
pip install wofrywise2 --no-deps
pip install oasys1-wiser --no-deps

REM 
REM  start Oasys using:
REM  python -m oasys.canvas -l4 --force-discovery
REM 

REM 






