@echo off

python -c "import sys, pkgutil; print(0 if pkgutil.find_loader('oasys_srw') else 1)" > fix.txt
set /p fix=<fix.txt
del fix.txt

if %fix%==0 (
    pip uninstall -y oasys-srwpy
    pip install oasys-srwpy --upgrade
) else (
    pip install oasys-srwpy --upgrade
    REM echo SRW not installed, yet
)

python -c "import sys, pkgutil; print(0 if pkgutil.find_loader('PyQt5.QtWebEngineWidgets') else 1)" > fix.txt
set /p fix=<fix.txt
del fix.txt

if %fix%==0 (
    pip uninstall -y PyQtWebEngine
    pip install PyQtWebEngine==5.14.0
) else (
    pip install PyQtWebEngine==5.14.0
    REM echo PyQtWebEngine not installed, yet
)


REM powershell -Command Invoke-WebRequest https://anl.box.com/s/58enqcetmzta2w4lkxnjus71wpfz8e30 -O OASYS1-ShadowOui-Advanced-Tools-1.0.114.tar.gz

REM python -c "import sys, pkgutil; print(0 if pkgutil.find_loader('orangecontrib.shadow_advanced_tools') else 1)" > fix.txt
REM set /p fix=<fix.txt
REM del fix.txt

REM if %fix%==0 (
REM     pip uninstall -y OASYS1-Shadow-Advanced-Tools
REM     pip install OASYS1-ShadowOui-Advanced-Tools-1.0.114.tar.gz
REM ) else (
REM     pip install OASYS1-ShadowOui-Advanced-Tools-1.0.114.tar.gz
REM )


