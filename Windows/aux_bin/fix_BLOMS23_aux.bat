@echo off

powershell -Command Invoke-WebRequest https://anl.box.com/shared/static/58enqcetmzta2w4lkxnjus71wpfz8e30.gz -O OASYS1-ShadowOui-Advanced-Tools-1.0.114.tar.gz

python -c "import sys, pkgutil; print(0 if pkgutil.find_loader('orangecontrib.shadow_advanced_tools') else 1)" > fix.txt
set /p fix=<fix.txt
del fix.txt

if %fix%==0 (
     pip uninstall -y OASYS1-Shadow-Advanced-Tools
     pip install OASYS1-ShadowOui-Advanced-Tools-1.0.114.tar.gz
) else (
     pip install OASYS1-ShadowOui-Advanced-Tools-1.0.114.tar.gz
)


