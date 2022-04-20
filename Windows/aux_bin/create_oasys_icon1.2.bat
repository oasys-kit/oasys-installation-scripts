@echo off

set curdir=%~s0
set curdir=%curdir:~0,-12%

%curdir%\create_link.bat -linkfile "C:%HOMEPATH%\Desktop\Oasys 1.2.lnk" -target "C:%HOMEPATH%\Miniconda3\Scripts\activate.bat" -linkarguments "& python -m oasys.canvas" -iconlocation "%curdir%\oasys.ico"



