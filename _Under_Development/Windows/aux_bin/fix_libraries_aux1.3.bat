@echo off

python -c "import sys, pkgutil; print(0 if pkgutil.find_loader('oasys_srw') else 1)" > fix.txt
set /p fix=<fix.txt
del fix.txt

if %fix%==0 (
    pip uninstall -y oasys-srwpy
    pip install oasys-srwpy --upgrade
) else (
    echo SRW not installed, yet
)

python -c "import sys, pkgutil; print(0 if pkgutil.find_loader('PyQt5.QtWebEngineWidgets') else 1)" > fix.txt
set /p fix=<fix.txt
del fix.txt

if %fix%==0 (
    pip uninstall -y PyQtWebEngine
    pip install PyQtWebEngine==5.14.0
) else (
    echo PyQtWebEngine not installed, yet
)



