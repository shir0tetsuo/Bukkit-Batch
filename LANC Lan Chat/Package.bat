@echo off
mode con: cols=50 lines=15
color 4f
REM ---Variables
REM Serverside Detection
set sft=sv.lsv
set EjectFile=eja.txt
REM Location File Data
set lf=loc.dat
set lfi=0
REM Virtual Model Data
set vm=2900
set vm1=2.9.0.0
set vm2=Dual Package Zero
REM Set Switches
set i4a=0
REM - i4a is Menu
REM ---Variables END
title LANCPackage
echo                     Welcome!
timeout /t 5
cls
REM First Use Lines
if not exist %lf% (
echo 
echo First time use. You will be required to specify
echo the path of the public folder.
timeout /T 5
goto sof
)
:lfd
REM Extraction of lf data
if exist %lf% (
set /P lfi=
)<%lf%
pushd %lfi%
if not exist %sft% (
echo [!] Error 404
echo The location provided does not land on a server.
timeout /t 5 /NOBREAK
)
REM Ejection Parameters 1
if exist %EjectFile% (
echo [!] This server is under maintenance.
pause
)
:sof
set i4a=0
cls
echo.
echo    %vm1% %vm2%
echo.
if exist %sft% echo                 1. Login
echo                 2. Path
echo                 3. Color
if not exist %sft% (
echo                 4. MapDrive
echo                 5. New
)
REM End of Start Of File
set /p i4a=$ 
if %i4a%==1 goto init
if %i4a%==2 goto path
if %i4a%==3 goto colset
if %i4a%==4 goto mapdri
if %i4a%==5 goto cnew
if %i4a%==0 (
echo 
goto sof
) ELSE (
echo 
goto sof
)
REM Initialize Login
:init
if not exist %sft% (
echo [!] No path was specified!
timeout /t 5
goto sof
)
pause

REM End of Login
:path
cls
popd
echo Please type in the full path of the server,
echo then press Enter.
echo ( Ex:  E:\ServerFolder\ )
set /P lfi=Path: 
echo %lfi%>%lf%
pause
goto lfd