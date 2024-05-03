@echo off
color 80
title PZ Server Monitor
SETLOCAL EnableExtensions

::Setting here
set RconPassword=
set Message=
set Hour=
set Minute=
set BoardcastHour=
set BoardcastMinute=
::Setting end

goto loop

:time
::Time to Boardcast
if Timer==true (
if %SysHour%==%BoardcastHour% (
    if %SysMin%==%BoardcastMinute% (
	rcon -a 127.0.0.1:27015 -p %RconPassword% "servermsg \"%message%\"
    )
)

::Time to restart
if %SysHour%==%Hour% (
    if %SysMin%==%Minute% (
	set timeout=60
	goto kill
    )
)
echo [%SysHour%:%SysMin%]:Waiting for %Hour%:%Minute%...
)
timeout /t 10 >NUL 2>&1


:loop
set timeout=60
set SysHour=%time:~0,2%
set SysMin=%time:~3,2%
for /f %%a in (target_pid.txt) do (set target_pid=%%a) 
if "%SysHour:~0,1%"==" " set SysHour=0%SysHour:~1,1%
if "%SysHour%"=="0" set SysHour=00
if "%SysHour:~1%"=="" set SysHour=0%SysHour%
if "%SysMin:~0,1%"==" " set SysMin=0%SysMin:~1,1%
if "%SysMin%"=="0" set SysMin=00
if "%SysMin:~1%"=="" set SysMin=0%SysMin%
if "%Hour:~0,1%"==" " set Hour=0%Hour:~1,1%
if "%Hour%"=="0" set Hour=00
if "%Hour:~1%"=="" set Hour=0%Hour%
if "%Minute:~0,1%"==" " set Minute=0%Minute:~1,1%
if "%Minute%"=="0" set Minute=00
if "%Minute:~1%"=="" set Minute=0%Minute%

:: Check if the process exists.
tasklist /FI "PID eq %target_pid%" | find "%target_pid%" > nul
if errorlevel==1 (
    echo [%SysHour%:%SysMin%]:Target process not running. Starting it now...
	set timeout=1
    goto startup
) else (
	cls
    echo [%SysHour%:%SysMin%]:Target process is running.
	goto time 
)

:: Check every 10 seconds 
timeout /t 10 >NUL 2>&1
goto loop

::Kill the target process
:kill
rcon -a 127.0.0.1:27015 -p %RconPassword% save
cls
echo Saving the current world,please wait...
timeout /t 30 >NUL 2>&1
taskkill /PID %target_pid%
:startup
timeout /t %timeout% >NUL 2>&1
color 07
@echo off
for /f "tokens=2 delims=," %%a in ('tasklist /nh /fo csv /fi "imagename eq cmd.exe"') do (
    echo %%~a > target_pid.txt
    goto :break
)
:break
title Project Zomboid Dedicated Server
call StartServer64.bat
