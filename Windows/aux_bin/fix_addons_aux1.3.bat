@echo off

python -c "import sys, pkgutil; print(0 if pkgutil.find_loader('orangecontrib.shadow_advanced_tools') else 1)" > fix.txt
set /p fix=<fix.txt
del fix.txt

if %fix%==0 (
    echo Do you want to update ShadowOui Advanced Tools?

    set /p "user_decision=[y]es, [n]o> [y]"
    if /I %user_decision%==y (
        powershell -Command Invoke-WebRequest https://files.pythonhosted.org/packages/f7/d2/18b6da994fef31ddc3e1df505b934223e4e6e7cf2fb09b29f12f0a2aabb0/OASYS1-ShadowOui-Advanced-Tools-1.0.125.tar.gz -O OASYS1-ShadowOui-Advanced-Tools-last.tar.gz
        pip install OASYS1-ShadowOui-Advanced-Tools-last.tar.gz --upgrade
     )
)
