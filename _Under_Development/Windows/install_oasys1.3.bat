@echo off

type nul>nul
setlocal enableDelayedExpansion

set user_dir=C:%HOMEPATH%

echo The HOMEPATH variable for this user is: %HOMEPATH%
echo Is it correct?

:ask_install

set /p "user_decision=[y]es, [n]o> [y]"

if /I "!user_decision!"=="y" (
    goto begin_installation
) else (
    if /I "!user_decision!"=="n" (
:ask_directory
        set /p user_dir=Please enter the new HOMEPATH value [it will affect the current script environment only]:

        if exist "C:!user_dir!" (
            echo Oasys will be installed in C:!user_dir!
	    set user_dir=C:!user_dir!

            goto begin_installation
        ) else (
            echo C:!user_dir! doesn't exist, please try again
            goto ask_directory
        )
    ) else (
        echo Invalid answer, please try again
        goto ask_install
    )
)

:begin_installation


if exist "%user_dir%\Miniconda3" (
    echo Miniconda distribution found

    set /p "user_decision=[r]ename, [d]elete or [k]eep it?> [d]"
    
    if /I "!user_decision!"=="d" (
        echo Deleting existing Miniconda ...
        rmdir /S /Q "%user_dir%\Miniconda3"
    ) else (
	if /I "!user_decision!"=="r" (
            for /f "tokens=*" %%a in ('powershell get-date -format "{yyyy-MM-dd_HH.mm.ss}"') do set td=%%a
            rename "%user_dir%\Miniconda3" Miniconda3_!td!
            echo Existing Miniconda renamed to Miniconda3_!td!
        ) else (
	    if /I "!user_decision!"=="k" (
                goto install_oasys
            ) else (
		        echo Deleting existing Miniconda ...
        	    rmdir /S /Q "%user_dir%\Miniconda3"
            )
        )
    )
	
    if %ERRORLEVEL% GEQ 1 goto batch_exit
) else (
    echo Miniconda not found
)

:install_miniconda

if exist "%cd%\Miniconda3-py38_4.9.2-Windows-x86_64.exe" (
    echo Miniconda Installer already downloaded
) else (
    echo Downloading Miniconda Installer ...
    powershell -Command Invoke-WebRequest https://repo.continuum.io/miniconda/Miniconda3-py38_4.9.2-Windows-x86_64.exe -O Miniconda3-py38_4.9.2-Windows-x86_64.exe
)

echo Executing Miniconda Installer, please install Miniconda in %user_dir%\Miniconda3

timeout -1

Miniconda3-py38_4.9.2-Windows-x86_64.exe

if exist "%user_dir%\Miniconda3\Scripts\activate.bat" (
    goto install_oasys
) else (
    echo Miniconda has not been installed in the directory: %user_dir%\Miniconda3
    goto batch_exit
)

:install_oasys

echo Installing Oasys...

start /wait /b cmd /c %cd%\aux_bin\install_libraries1.3.bat
start /wait /b cmd /c %cd%\aux_bin\create_oasys_icon1.3.bat

if exist "%cd%\Miniconda3-py38_4.9.2-Windows-x86_64.exe" (
    set /p "user_decision=Do you want to [d]elete or [k]eep Miniconda installer?> [k]"
    if /I "!user_decision!"=="d" (
        del /s Miniconda3-py38_4.9.2-Windows-x86_64.exe
    ) else (
        echo Installer kept in folder %cd%
    )
)

echo --------------------------------------------------------------
echo Oasys installation completed!
echo Double click the icon in the Desktop to run the program"
echo --------------------------------------------------------------

timeout -1 

:batch_exit

exit \b
