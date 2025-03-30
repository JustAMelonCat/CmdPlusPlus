:Cmd++
@echo off
title Cmd++
echo  Cmd++ - [Version 1.2.5] Type "about" For Info, Type "helpmenu" For Commands
echo  To Run As Admin Type "runasadmin"
echo.
:Interperate
Title Cmd++

set /p Command="[%username%]--> "
if "%Command%"=="runasadmin" goto :runasadmin
if "%Command%"=="regtweak" goto :regtweak
if "%Command%"=="ipinfo" goto :IPInfo
if "%Command%"=="convertip" goto :ConvertIP
if "%Command%"=="helpmenu" goto :Help
if "%Command%"=="easyping" goto :easyping
if "%Command%"=="about" goto :about
if "%Command%"=="currentip" goto :displayip
if "%Command%"=="uacbypass" goto :uacbypass
if "%Command%"=="clitaskmgr" goto :clitaskmgr
if "%Command%"=="clearscreen" goto :ClearScreen
if "%Command%"=="legacytaskmgr" goto :fallbacktaskmgr
%Command%
set "Command="
goto :Interperate

:regtweak
title RegTweak
net session >nul 2>&1
if %errorLevel% == 0 (
goto :adminregtweak
) else (
    echo Admin Is Required To Enter RegTweak, Type "runasadmin" Then Run "regtweak" Again
    goto :Interperate
)
cls
:adminregtweak
cls
echo  RegTweak - [Version 1.0] Type "help" For Tweaks
:regtweakprompt
set /p regtweak="[%username%]--> "
if "%regtweak%"=="addlegacycontextmenu" reg add HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 /ve /d "" /f && echo Value Added Successfully
if "%regtweak%"=="revertlegacycontextmenu" reg delete HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2} /f && echo Value Added Successfully
if "%regtweak%"=="restartexplorer" taskkill /f /im explorer.exe && start explorer
if "%regtweak%"=="help" goto :regtweakhelp
if "%regtweak%"=="exit" goto :ClearScreen


goto :regtweakprompt

:regtweakhelp
echo Regtweak Commands:
echo  exit - Exits regtweak and goes back to Cmd++
echo Explorer Tweaks:
echo  addlegacycontextmenu - Adds The Legacy Windows 10 Context Menu To Explorer And Desktop
echo  revertlegacycontextmenu - Removes The Legacy Windows 10 Context Menu And Reverts Back To Original
echo  restartexplorer - Restarts Explorer To Apply Context Menu And Other Changes For Explorer
goto :regtweakprompt

:runasadmin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
 echo Requesting administrative privileges...
 goto UACPrompt
) else (
 echo Already Running with administrative privileges, Returning...
goto :Interperate
)


:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /b



:fallbacktaskmgr
start taskmgr -d
goto :Interperate

:ClearScreen
cls
goto :Cmd++


:ipinfo
echo Enter IP To Look Up
set /p ip="[%username%]--> "
curl https://ipinfo.io/%ip%/json
goto :interperate


:displayip
for /f "tokens=14 delims= " %%i in ('ipconfig ^| findstr /i "IPv4"') do set IP=%%i
echo Your ip is: %IP%
goto interperate


:ConvertIP
echo Enter Private IP
set /p privateIP="[%username%]--> "

echo Checking public IP for private IP: %privateIP% ...
for /f "tokens=2 delims=[]" %%i in ('ping -n 1 %privateIP%') do (
    set localIP=%%i
)

echo Local IP is: %localIP%

echo Fetching public IP address...
curl ifconfig.me
goto interperate


:easyping
echo Target IP:
set /p IP="[%username%]--> "
echo Bytes Of Data To Send:
set /p Bytes="[%username%]--> "
ping -l %bytes% %ip%
goto :Interperate


:uacbypass
echo Enter Path Of File To Execute:
set /p usabypass="[%username%]--> "
cmd /min /C "set __COMPAT_LAYER=runasinvoker && start ""%uacbypass%"%1"
goto interperate



:about
echo   ...................................   
echo   .:::::::::::-----------=+++++++++=:   
echo   .:::::::::::-==========+**********=   
echo   :===========+++++++++++***********=   
echo   -#################################+   
echo   -#####+=##########################+   
echo   -###*::::=########################+   
echo   -#####+::::=######################+   
echo   -#######=::::+####################+   
echo   -#######*--:-+####################+   
echo   -#####*====*######################+   
echo   -####====+######*::::::::::+######+   
echo   -#####**########*::::::::::+######+   
echo   -#################################+   
echo   .=++++++++++++++++++++++++++++++++: 
echo.
echo Current Version - [Version 1.2.4]
echo.
echo Created By JustAMelonCat - Github: github.com/JustAMelonCat
echo.
echo If you want any help with commands type "helpmenu" to see the command help menu
echo.                                     
goto :interperate                





:Help
echo ============================================================================
echo Command Help Menu
echo ============================================================================
echo  Note - Commands Are Case Sensitive, Remember, lowercase Only
echo.
echo  ipinfo - Uses Curl To Get Infomation From A Specified IP From Website (Needs Inteernet)
echo  easyping - Easy UI For Pinging IPs (Needs Inteernet)
echo  convertip - Convets Private IP To Public IP (Beta) (Needs Inteernet)
echo  about - Gives Information About Cmd++, The Version, Source And Creator
echo  helpmenu - See This Menu Again!
echo  currentip - Shows Your Current IP (Needs Inteernet)
echo  uacbypass - Lets You Bypass UAC Prompt On Certain EXE Files
echo  clitaskmgr - Light Weight Beta Task Manager Made To Be A CLI That Uses Less Ram Than Taskmgr
echo  legacytaskmgr - Opens The Original Windows 10 Taskmgr
echo  regtweak - Tweak registry values with preset commands
echo Cmd++ Uses Commands That Are Already Build Into Windows For Normal Cmd
echo ============================================================================
echo.
echo.
goto :Interperate




:clitaskmgr
tasklist
echo .
echo Type In The PID Or File Name Of A Task You Want End...
echo Type Exit To Leave...
set /p PID="[%username%]--> "
if "%PID%"=="Exit" goto :Interperate
if "%PID%"=="exit" goto :Interperate
Taskkill /f /im %PID%
goto Taskmng






