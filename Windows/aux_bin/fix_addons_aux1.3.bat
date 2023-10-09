@echo off

python -c "import sys, pkgutil; print(0 if pkgutil.find_loader('orangecontrib.shadow_advanced_tools') else 1)" > fix.txt
set /p fix=<fix.txt
del fix.txt

if %fix%==1 (
    echo Do you want to install ShadowOui Advanced Tools?

    set /p "user_decision=[y]es, [n]o> [y]"
    if /I %user_decision%==y (
        powershell -Command Invoke-WebRequest https://files.pythonhosted.org/packages/a8/07/97c986facd100f57e8b8e64627bf13e2f21ffa4cab79ddfd639f27441863/OASYS1-ShadowOui-Advanced-Tools-1.0.116.tar.gz -O OASYS1-ShadowOui-Advanced-Tools-last.tar.gz
        pip install OASYS1-ShadowOui-Advanced-Tools-last.tar.gz --upgrade
     )
)
