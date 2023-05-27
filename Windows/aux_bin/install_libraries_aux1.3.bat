@echo off

pip install pip --upgrade
cmd /c conda install git
cmd /c conda install -c conda-forge xraylib=4.1.2
pip install oasys1 --upgrade

echo Do you want to run OASYS now and check it?

set /p "user_decision=[y]es, [n]o> [n]"

if /I "!user_decision!"=="y" (
    python -m oasys.canvas -l4
)




