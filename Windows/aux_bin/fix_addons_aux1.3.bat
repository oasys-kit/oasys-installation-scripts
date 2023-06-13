@echo off

python -c "import sys, pkgutil; print(0 if pkgutil.find_loader('orangecontrib.shadow_advanced_tools') else 1)" > fix.txt
set /p fix=<fix.txt
del fix.txt

if %fix%==0 (
     powershell -Command Invoke-WebRequest https://anl.box.com/shared/static/xv0vjuss4kbgmyyks8226piad81ftfa3.gz -O OASYS1-ShadowOui-Advanced-Tools-last.tar.gz

     pip uninstall -y OASYS1-Shadow-Advanced-Tools
     pip install OASYS1-ShadowOui-Advanced-Tools-last.tar.gz
)

