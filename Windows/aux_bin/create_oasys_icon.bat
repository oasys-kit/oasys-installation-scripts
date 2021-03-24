@echo off

"%cd%\aux_bin\create_link.bat" -linkfile "C:%HOMEPATH%\Desktop\Oasys 1.2.lnk" -target "C:%HOMEPATH%\Miniconda3\Scripts\activate.bat" -linkarguments "& python -m oasys.canvas --force-discovery" -iconlocation "%cd%\aux_bin\oasys.ico"



