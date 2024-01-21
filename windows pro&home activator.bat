@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------
@ECHO OFF

:choice
set /P c=Are you using windows 10 pro(y) or windows 10 home(n)[Y/N]?
if /I "%c%" EQU "Y" goto :somewhere
if /I "%c%" EQU "N" goto :somewhere_else
goto :choice


:somewhere

slmgr.vbs -skms kms.ddns.net
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr.vbs /ato

pause
exit

:somewhere_else

slmgr.vbs -skms kms.ddns.net
slmgr /ipk 46J3N-RY6B3-BJFDY-VBFT9-V22HG
slmgr.vbs /ato

pause
exit