@echo off

%cd%\aux_bin\create_link.bat -linkfile "%user_dir%\Desktop\Oasys 1.3.lnk" -target "%user_dir%\Miniconda3\Scripts\activate.bat" -linkarguments "& python -m oasys.canvas" -iconlocation "%cd%\aux_bin\oasys.ico"



