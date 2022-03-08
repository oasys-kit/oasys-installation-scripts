@echo off

set filelink = "C:%HOMEPATH%\Desktop\Oasys 1.2.lnk"

echo Checking users home for Desktop folder which can sometimes be missing if the
echo desktop is redirected towards "c:\users\<username>Onedrive - <ORGNAME>\Desktop"
if not exist "C:%HOMEPATH%\Desktop" (
	echo Looking for Desktop folder in the Onedrive.
	if exist "%OneDrive%\Desktop" (
		set filelink="%OneDrive%\Desktop\Oasys 1.2.lnk"
		)
	)
echo The link to be created is: %filelink%

%cd%\aux_bin\create_link.bat -linkfile %filelink% -target "C:%HOMEPATH%\Miniconda3\Scripts\activate.bat" -linkarguments "& python -m oasys.canvas" -iconlocation "%cd%\aux_bin\oasys.ico"



