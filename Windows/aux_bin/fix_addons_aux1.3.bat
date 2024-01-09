@echo off

python -c "import sys, pkgutil; print(0 if pkgutil.find_loader('orangecontrib.shadow_advanced_tools') else 1)" > fix.txt
set /p fix=<fix.txt
del fix.txt

if %fix%==0 (
   powershell -Command Invoke-WebRequest https://files.pythonhosted.org/packages/3a/e7/567f994decf333417f4ae2f0c91a3f6bfa081d7d712e4cc4f68280a9935e/OASYS1-ShadowOui-Advanced-Tools-1.0.127.tar.gz -O OASYS1-ShadowOui-Advanced-Tools-last.tar.gz
   pip install OASYS1-ShadowOui-Advanced-Tools-last.tar.gz --upgrade
)
