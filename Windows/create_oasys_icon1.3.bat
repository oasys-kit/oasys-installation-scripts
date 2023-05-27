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

start /wait /b cmd /c %cd%\aux_bin\create_oasys_icon1.3.bat

timeout -1 

:batch_exit

exit \b
