@echo off

set filelink = "C:%HOMEPATH%\Desktop\Oasys 1.2.lnk"

if not exist "C:%HOMEPATH%\Desktop" (
	echo Desktop folder is missing, looking for Desktop folder in Onedrive.
	if exist "%OneDrive%\Desktop" (
		set filelink="%OneDrive%\Desktop\Oasys 1.2.lnk"
		)
	)
echo The link to be created is: %filelink%

set curdir=%~s0
set curdir=%curdir:~0,-12%

%curdir%\create_link.bat -linkfile %filelink% -target "C:%HOMEPATH%\Miniconda3\Scripts\activate.bat" -linkarguments "& python -m oasys.canvas" -iconlocation "%curdir%\oasys.ico"



