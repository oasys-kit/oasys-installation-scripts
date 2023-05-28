@echo off

powershell -Command Invoke-WebRequest https://anl.box.com/shared/static/258velh41m5f29ppj49qsjl12oz715uy.gz -O OASYS1-ShadowOui-Advanced-Tools-1.0.115.tar.gz

python -c "import sys, pkgutil; print(0 if pkgutil.find_loader('orangecontrib.shadow_advanced_tools') else 1)" > fix.txt
set /p fix=<fix.txt
del fix.txt

if %fix%==0 (
     pip uninstall -y OASYS1-Shadow-Advanced-Tools
     pip install OASYS1-ShadowOui-Advanced-Tools-1.0.115.tar.gz
) else (
     pip install OASYS1-ShadowOui-Advanced-Tools-1.0.115.tar.gz
)


