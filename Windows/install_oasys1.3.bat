@echo off

echo OASYS 1.3 has not been released, yet. This is a beta version, that is unstable.
echo We suggest to install OASYS 1.2. Do you want to interrupt the current installation?

:ask_install
set /p "user_decision=[y]es, [n]o> [y]"

if /I "!user_decision!"=="y" (
    goto begin_installation
) else (
	if /I "!user_decision!"=="n" (
        goto batch_exit
    ) else (
        echo Invalid answer, please try again
        goto ask_install
    )
)

:begin_installation

type nul>nul
setlocal enableDelayedExpansion

if exist "C:%HOMEPATH%\Miniconda3" (
    echo Miniconda distribution found

    set /p "user_decision=[r]ename, [d]elete or [k]eep it?> [d]"
    
    if /I "!user_decision!"=="d" (
        echo Deleting existing Miniconda ...
        rmdir /S /Q "C:%HOMEPATH%\Miniconda3"
    ) else (
	if /I "!user_decision!"=="r" (
            for /f "tokens=*" %%a in ('powershell get-date -format "{yyyy-MM-dd_HH.mm.ss}"') do set td=%%a
            rename "C:%HOMEPATH%\Miniconda3" Miniconda3_!td!
            echo Existing Miniconda renamed to Miniconda3_!td!
        ) else (
	    if /I "!user_decision!"=="k" (
                goto install_oasys
            ) else (
		        echo Deleting existing Miniconda ...
        	    rmdir /S /Q "C:%HOMEPATH%\Miniconda3"
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

echo Executing Miniconda Installer, please install Miniconda in C:%HOMEPATH%\Miniconda3

timeout -1

Miniconda3-py38_4.9.2-Windows-x86_64.exe

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
