:Cmd++
@echo off
title Cmd++
echo  Cmd++ - [Version 1.2.7] Type "about" For Info, Type "helpmenu" For Commands
echo  Running As %username%
echo  To Run As Admin Type "runasadmin"
echo.

:Interperate
Title Cmd++
set /p Command="[%username%]--> "
if /i "%Command%"=="runasadmin" goto :runasadmin
if /i "%Command%"=="regtweak" goto :regtweak
if /i "%Command%"=="ipinfo" goto :IPInfo
if /i "%Command%"=="convertip" goto :ConvertIP
if /i "%Command%"=="helpmenu" goto :Help
if /i "%Command%"=="easyping" goto :easyping
if /i "%Command%"=="about" goto :about
if /i "%Command%"=="currentip" goto :displayip
if /i "%Command%"=="uacbypass" goto :uacbypass
if /i "%Command%"=="clitaskmgr" goto :clitaskmgr
if /i "%Command%"=="clearscreen" goto :ClearScreen
if /i "%Command%"=="legacytaskmgr" goto :fallbacktaskmgr
if /i "%Command%"=="cleanup" goto :cleanup
%Command%
set "Command="
goto :Interperate

:regtweak
title RegTweak
net session >nul 2>&1
if /i %errorLevel% == 0 (
goto :adminregtweak
) else (
    echo Admin Is Required To Enter RegTweak, Type "runasadmin" Then Run "regtweak" Again
    goto :Interperate
)
cls
:adminregtweak
cls
echo  RegTweak - [Version 1.2] Type "help" For Tweaks
:regtweakprompt
set /p regtweak="[%username%]--> "
if /i "%regtweak%"=="addlegacycontextmenu" reg add HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 /ve /d "" /f && echo Value Successfully Changed && if %errorLevel% NEQ 0 (echo Failed, Please Try Again)
if /i "%regtweak%"=="revertlegacycontextmenu" reg delete HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2} /f && echo Value Successfully Changed && if %errorLevel% NEQ 0 (echo Failed, Please Try Again)
if /i "%regtweak%"=="restartexplorer" taskkill /f if /im explorer.exe && start explorer && if %errorLevel% NEQ 0 (echo Failed, Please Try Again)
if /i "%regtweak%"=="enableverbosestatusmessages" reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v "verbosestatus" /t REG_DWORD /d 1 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="disableverbosestatusmessages" reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v "verbosestatus" /t REG_DWORD /d 0 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="disablenewsandweather" reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "TaskbarDa" /t REG_DWORD /d 0 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="enablenewsandweather" reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "TaskbarDa" /t REG_DWORD /d 1 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="enablefastshutdown" reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control  /v WaitToKillServiceTimeout  /t REG_SZ /d 2000 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="disablefastshutdown" reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control  /v WaitToKillServiceTimeout  /t REG_SZ /d 5000 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="enablefasterstartupapps" reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize /v StartupDelayinMSec /t REG_DWORD /d 1 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="disablefasterstartupapps" reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize /v StartupDelayinMSec /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed

if /i "%regtweak%"=="help" goto :regtweakhelp
if /i "%regtweak%"=="exit" goto :ClearScreen

goto :regtweakprompt

:regtweakhelp
echo Regtweak Commands:
echo  exit - Exits regtweak and goes back to Cmd++
echo.
echo Explorer Tweaks:
echo  addlegacycontextmenu - Adds The Legacy Windows 10 Context Menu To Explorer And Desktop
echo  revertlegacycontextmenu - Removes The Legacy Windows 10 Context Menu And Reverts Back To Original
echo  restartexplorer - Restarts Explorer To Apply Context Menu And Other Changes For Explorer
echo. 
echo Verbose Status Messages:
echo  enableverbosestatusmessages - Enables Verbose Status Messages For Startup, Login And Shutdown
echo  disableverbosestatusmessages - Disables Verbose Status Messages
echo. 
echo News And Weather:
echo  disablenewsandweather - Removes News And Weather Icons From The Taskbar
echo  enablenewsandweather - Enables News And Weather Icons On The Taskbar
echo. 
echo Shutdown Process:
echo  enablefastshutdown - Speeds Up Service Kill Time For Faster Shutdown Time
echo  disablefastshutdown - Changes Service Kill Time To Default
echo.
echo Startup App Speed:
echo  enablefasterstartupapps - Decreases The Delay Before StartUp Apps Open On Login Or StartUp
echo  disablefasterstartupapps - Increases The Delay Before StartUp Apps Open On Login Or Startup
goto :regtweakprompt

:cleanup
title Cleaning Up Temp Files...
@echo off
echo Cleaning up temporary files...

del /q %temp%\*.* >nul

del /q "%localappdata%\Microsoft\Windows\Temporary Internet Files\*.*" >nul

del /q "%appdata%\Microsoft\Windows\Recent\*.*" > nul

echo Cleanup Complete
goto :Interperate

:runasadmin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if /i '%errorlevel%' NEQ '0' (
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
curl https:/if /ipinfo.io/%ip%/json
goto :interperate

:displayip
for /f "tokens=14 delims= " %%i in ('ipconfig ^| findstr if /i "IPv4"') do set IP=%%i
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
curl if /iconfig.me
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
echo Current Version - [Version 1.2.7]
echo.
echo Created By JustAMelonCat - Github: github.com/JustAMelonCat
echo.
echo If You Want Any Help Hith Commands Type "helpmenu" To See The Command Help Menu
echo.                                     
goto :interperate                

:Help
echo ============================================================================
echo Command Help Menu
echo ============================================================================
echo  ipinfo - Uses Curl To Get Infomation From A Specif /iied IP From Website (Needs Inteernet)
echo  easyping - Easy UI For Pinging IPs (Needs Inteernet)
echo  convertip - Convets Private IP To Public IP (Beta) (Needs Inteernet)
echo  about - Gives Information About Cmd++, The Version, Source And Creator
echo  helpmenu - See This Menu Again!
echo  currentip - Shows Your Current IP (Needs Inteernet)
echo  uacbypass - Lets You Bypass UAC Prompt On Certain EXE Files
echo  clitaskmgr - Light Weight Beta Task Manager Made To Be A CLI That Uses Less Ram Than Taskmgr
echo  legacytaskmgr - Opens The Original Windows 10 Taskmgr
echo  regtweak - Tweak registry values with preset commands
echo  cleanup - Cleans Up Temp Files And Prefetch
echo Cmd++ Uses Commands That Are Already Build Into Windows For Normal Cmd
echo ============================================================================
goto :Interperate

:clitaskmgr
tasklist
echo .
echo Type In The PID Or File Name Of A Task You Want End...
echo Type Exit To Leave...
set /p PID="[%username%]--> "
if /i "%PID%"=="Exit" goto :Interperate
if /i "%PID%"=="exit" goto :Interperate
Taskkill /f if /im %PID%
goto Taskmng
