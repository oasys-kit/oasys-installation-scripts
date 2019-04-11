%
% Before using this bat file, Oasys must be installed (see install_oasys_windows.bat) 
% try: python -m oasys.canvas -l4 --force-discovery
% Oasys should start (with no add-ons)
%
%
% ** IMPORTANT: DO NOT USE THE ADD-ONS MENU IN THE OASYS MENU -- DO NOT UPGRADE ADDONS USING THE OASYS MENU ***
%


%
% install manually add-ons [check each one before continuing...]
%


%
% syned and wofry widgets
%
pip install oasys1-syned --no-deps
pip install oasys1-wofry --no-deps


%
% install srwlib
%
pip install vinyl-srw


%
% install xraylib
%

conda install -c conda-forge xraylib=3.3.0


%
% install xoppy
%
pip install pySRU

git clone https://github.com/panosc-vinyl/xoppy
cd xoppy
pip install . --no-deps
cd ..

%
% install srw
%

git clone https://github.com/panosc-vinyl/wofrysrw
cd wofrysrw
pip install . --no-deps
cd ..

git clone https://github.com/panosc-vinyl/oasys-srw
cd oasys-srw
pip install . --no-deps
cd ..


%
% shadow  
%

git clone https://github.com/panosc-vinyl/shadow3
cd shadow3
install_python_bind.bat
cd ..

pip install wofryshadow --no-deps

git clone https://github.com/panosc-vinyl/shadowOui
cd vinyl/shadowOui
pip install . --no-deps
cd ..


%
% wiser
%

pip install wiselib2 --no-deps
pip install wofrywise2 --no-deps
pip install oasys1-wiser --no-deps

%
% start Oasys using:
% python -m oasys.canvas -l4 --force-discovery
%

%






