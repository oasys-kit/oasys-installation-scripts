@echo off

type nul>nul
setlocal enableDelayedExpansion

REM sometimes the HOMEPATH Variable is broken: must be set here correctly
REM set HOMEPATH=\Users\<user name>

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

if exist "%cd%\Miniconda3-4.7.12.1-Windows-x86_64.exe" (
    echo Miniconda Installer already downloaded
) else (
    echo Downloading Miniconda Installer ...
    powershell -Command Invoke-WebRequest https://repo.continuum.io/miniconda/Miniconda3-4.7.12.1-Windows-x86_64.exe -O Miniconda3-4.7.12.1-Windows-x86_64.exe
)

echo Executing Miniconda Installer, please install Miniconda in C:%HOMEPATH%\Miniconda3

timeout -1

Miniconda3-4.7.12.1-Windows-x86_64.exe

:install_oasys

echo Installing Oasys...

start /wait /b cmd /c %cd%\aux_bin\install_libraries.bat
start /wait /b cmd /c %cd%\aux_bin\create_oasys_icon.bat

if exist "%cd%\Miniconda3-4.7.12.1-Windows-x86_64.exe" (
    set /p "user_decision=Do you want to [d]elete or [k]eep Miniconda installer?> [k]"
    if /I "!user_decision!"=="d" (
        del /s Miniconda3-4.7.12.1-Windows-x86_64.exe
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
