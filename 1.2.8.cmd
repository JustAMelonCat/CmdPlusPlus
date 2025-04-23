::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCiDJHSdtGYiIQ1RcCePOCDxOpkT6+n31eudtxU2Gus8d+8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCiDJHSdtGYiIQ1RcCePOCDxOpYR7KOwoe+fpy0=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
:Cmd++
@echo off
title Cmd++
echo  Cmd++ - [Version 1.2.8] Type "about" For Info, Type "helpmenu" For Commands
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
echo  RegTweak - [Version 1.3] Type "help" For Tweaks
echo  Make Sure To Backup Registry before Tweaking, Do This By Running "backup" And Let It finished!
echo  If Anything Goes Wrong Run "import" To Import The Exported Registry Files!
echo  Some Registry Tweaks Require A System Restart To Apply
:regtweakprompt
set /p regtweak="[%username%]--> "
if /i "%regtweak%"=="addlegacycontextmenu" reg add HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 /ve /d "" /f && echo Value Successfully Changed && if %errorLevel% NEQ 0 (echo Failed, Please Try Again)
if /i "%regtweak%"=="revertlegacycontextmenu" reg delete HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2} /f && echo Value Successfully Changed && if %errorLevel% NEQ 0 (echo Failed, Please Try Again)
if /i "%regtweak%"=="restartexplorer" taskkill /f if /im explorer.exe && start explorer && if %errorLevel% NEQ 0 (echo Failed, Please Try Again)
if /i "%regtweak%"=="enableverbosestatusmessages" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "verbosestatus" /t REG_DWORD /d 1 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="disableverbosestatusmessages" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "verbosestatus" /t REG_DWORD /d 0 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="disablenewsandweather" reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="enablenewsandweather" reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 1 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="enablefastshutdown" reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control"  /v WaitToKillServiceTimeout  /t REG_SZ /d 100 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="disablefastshutdown" reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control"  /v WaitToKillServiceTimeout  /t REG_SZ /d 5000 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="enablefasterstartupapps" reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayinMSec /t REG_DWORD /d 0 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="disablefasterstartupapps" reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayinMSec /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="fasterresponsetime" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="defaultresponsetime" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="disablenetworkthrottling" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="enablenetworkthrottling" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 10 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="highergpupriority" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 00000008 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="defaultgpupriority" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 00000002 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="highertgamepriority" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="lowertgamepriority" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 2 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="disablecoreparking" reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v ValueMax /t REG_DWORD /d 0 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="enablecoreparking" reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v ValueMax /t REG_DWORD /d 64 /f && if %errorLevel% NEQ 0 (echo Failed, Please Try Again) else echo Value Successfully Changed
if /i "%regtweak%"=="disableframeprerender" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v MaxPreRenderedFrames /t REG_DWORD /d 1 /f
if /i "%regtweak%"=="enableframeprerender" reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v MaxPreRenderedFrames /f
if /i "%regtweak%"=="largersystemchache" reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f
if /i "%regtweak%"=="defaultsystemchache" reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 0 /f

if /i "%regtweak%"=="import" goto :regimport
if /i "%regtweak%"=="backup" goto :regbackup
if /i "%regtweak%"=="help" goto :regtweakhelp
if /i "%regtweak%"=="exit" goto :ClearScreen
set "regtweak="

goto :regtweakprompt

:regtweakhelp
echo Regtweak Commands:
echo  exit - Exits Regtweak And Goes Back To Cmd++
echo  backup - Creates Backups Of The Registry To A Folder On Your Desktop
echo  import - Imports Registry Files From Exported Folder On Desktop
echo.
echo Explorer Tweaks:
echo  addlegacycontextmenu - Adds The Legacy Windows 10 Context Menu To Explorer And Desktop
echo  revertlegacycontextmenu - Removes The Legacy Windows 10 Context Menu And Reverts Back To Original
echo  restartexplorer - Restarts Explorer To Apply Context Menu And Other Changes For Explorer
echo. 
echo Verbose Status Messages:
echo  disableverbosestatusmessages - Disables Verbose Status Messages
echo  enableverbosestatusmessages - Enables Verbose Status Messages For Startup, Login And Shutdown
echo. 
echo News And Weather:
echo  disablenewsandweather - Removes News And Weather Icons From The Taskbar
echo  enablenewsandweather - Enables News And Weather Icons On The Taskbar
echo. 
echo Shutdown Process:
echo  disablefastshutdown - Changes Service Kill Time To Default
echo  enablefastshutdown - Speeds Up Service Kill Time For Faster Shutdown Time
echo.
echo Startup App Speed:
echo  disablefasterstartupapps - Increases The Delay Before StartUp Apps Open On Login Or Startup
echo  enablefasterstartupapps - Decreases The Delay Before StartUp Apps Open On Login Or StartUp
echo.
echo Response Time:
echo  fasterresponsetime - Speeds Up System Response Time
echo  defaultresponsetime - Sets Response Time To Default
echo.
echo Network Throttling:
echo  disablenetworkthrottling - Disables Network Throttling For Maximum Network Speed
echo  enablenetworkthrottling - Enables Network Throttling By Setting It To Default
echo.
echo Gpu Priority:
echo  highergpupriority - Makes The Gpu Priority For Apps Higher Than Default Wich 
echo  defaultgpupriority - Reverts Gpu Priority To Default 
echo.
echo Game Priority:
echo  highertgamepriority - Increases The Priority For Games, Making Stutters Less Common
echo  lowertgamepriority - Decreases The Priority For Games To Default 
echo.
echo Disable Core Parking:
echo  disablecoreparking - Makes The Allowed Percentage Of Cores To Be Parked Set To 0 Making All Cores Active
echo  enablecoreparking - Makes The Allowed Percentage Of Cores To Be parked Set To The Default Of 64 
echo.
echo Pre Rendered Frames:
echo  disableframeprerender - Forces The Computer To Render Frames In Real Time Instead Of Rendering Future Frames
echo  enableframeprerender - Deletes The Key For Pre Rendered Frames Making The Graphics Driver Decide 
echo.
echo System Cache:
echo  largersystemchache - Expands The System Cache Size For Quicker Accsess To System Files
echo  defaultsystemchache - Lets Windows Automatically Decide What The System Cache Size Should Be
goto :regtweakprompt

:regimport
setlocal

set "backupFolder=%UserProfile%\Desktop\Reg Backup"

echo Importing registry files from: "%backupFolder%"
echo.

if exist "%backupFolder%\HKEY_CLASSES_ROOT.reg" (
    echo Importing HKEY_CLASSES_ROOT.reg...
    reg import "%backupFolder%\HKEY_CLASSES_ROOT.reg"
    if errorlevel 1 (
        echo Error importing HKEY_CLASSES_ROOT.reg!
    ) else (
        echo HKEY_CLASSES_ROOT.reg imported successfully.
    )
    echo.
) else (
    echo Warning: HKEY_CLASSES_ROOT.reg not found in the backup folder.
    echo.
)

if exist "%backupFolder%\HKEY_CURRENT_USER.reg" (
    echo Importing HKEY_CURRENT_USER.reg...
    reg import "%backupFolder%\HKEY_CURRENT_USER.reg"
    if errorlevel 1 (
        echo Error importing HKEY_CURRENT_USER.reg!
    ) else (
        echo HKEY_CURRENT_USER.reg imported successfully.
    )
    echo.
) else (
    echo Warning: HKEY_CURRENT_USER.reg not found in the backup folder.
    echo.
)

if exist "%backupFolder%\HKEY_LOCAL_MACHINE.reg" (
    echo Importing HKEY_LOCAL_MACHINE.reg...
    reg import "%backupFolder%\HKEY_LOCAL_MACHINE.reg"
    if errorlevel 1 (
        echo Error importing HKEY_LOCAL_MACHINE.reg!
    ) else (
        echo HKEY_LOCAL_MACHINE.reg imported successfully.
    )
    echo.
) else (
    echo Warning: HKEY_LOCAL_MACHINE.reg not found in the backup folder.
    echo.
)

if exist "%backupFolder%\HKEY_USERS.reg" (
    echo Importing HKEY_USERS.reg...
    reg import "%backupFolder%\HKEY_USERS.reg"
    if errorlevel 1 (
        echo Error importing HKEY_USERS.reg!
    ) else (
        echo HKEY_USERS.reg imported successfully.
    )
    echo.
) else (
    echo Warning: HKEY_USERS.reg not found in the backup folder.
    echo.
)

if exist "%backupFolder%\HKEY_CURRENT_CONFIG.reg" (
    echo Importing HKEY_CURRENT_CONFIG.reg...
    reg import "%backupFolder%\HKEY_CURRENT_CONFIG.reg"
    if errorlevel 1 (
        echo Error importing HKEY_CURRENT_CONFIG.reg!
    ) else (
        echo HKEY_CURRENT_CONFIG.reg imported successfully.
    )
    echo.
) else (
    echo Warning: HKEY_CURRENT_CONFIG.reg not found in the backup folder.
    echo.
)

echo.
echo Registry import process finished.
endlocal
goto :regtweakprompt

:regbackup
setlocal

set "backupFolder=%UserProfile%\Desktop\Reg Backup"

echo Creating backup folder: "%backupFolder%"
mkdir "%backupFolder%" 2>nul

echo Exporting registry hives...

reg export HKEY_CLASSES_ROOT "%backupFolder%\HKEY_CLASSES_ROOT.reg" /y
echo Exported HKEY_CLASSES_ROOT.reg

reg export HKEY_CURRENT_USER "%backupFolder%\HKEY_CURRENT_USER.reg" /y
echo Exported HKEY_CURRENT_USER.reg

reg export HKEY_LOCAL_MACHINE "%backupFolder%\HKEY_LOCAL_MACHINE.reg" /y
echo Exported HKEY_LOCAL_MACHINE.reg

reg export HKEY_USERS "%backupFolder%\HKEY_USERS.reg" /y
echo Exported HKEY_USERS.reg

reg export HKEY_CURRENT_CONFIG "%backupFolder%\HKEY_CURRENT_CONFIG.reg" /y
echo Exported HKEY_CURRENT_CONFIG.reg

echo.
echo Registry export complete! Backups saved in "%backupFolder%"

endlocal
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
echo Current Version - [Version 1.2.8]
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