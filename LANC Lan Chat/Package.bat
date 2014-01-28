@echo off
set cols=50
set lines=15
mode con: cols=%cols% lines=%lines%
set ccp=4f
color %ccp%
REM ---Variables
REM Serverside Detection
set sft=sv.lsv
set EjectFile=eja.txt
REM Location File Data
set lf=loc.dat
set lfi=0
REM Virtual Model Data
set vm=2900e
set vm1=2.9.0.0
set vm2=Dual Package Zero
REM Set Switches
set i4a=0
REM - i4a is Menu
REM ---Variables END
REM ---Welcome
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
REM Extraction of lf data and first 404 message
if exist %lf% (
set /P lfi=
)<%lf%
pushd %lfi%
if not exist %sft% (
color %ccp%
echo [!] Error 404
echo The location provided does not land on a server.
timeout /t 5 /NOBREAK
)
REM Ejection Parameters 1
if exist %EjectFile% (
echo [!] This server is under maintenance.
pause
)
REM ---Welcome END
REM ---NEWSTARTER
REM Start of File
:sof
mode con: cols=%cols% lines=%lines%
color %ccp%
set i4a=0
cls
echo.
echo    %vm1% %vm2%
echo.
if exist %sft% echo                 1. Login
echo                 2. Path
echo                 3. Color
echo                 4. Map Network Drive
echo                 5. Help
if not exist %sft% (
echo                 6. New
)
REM Menu Select
set /p i4a=$ 
if %i4a%==1 goto init
if %i4a%==2 goto path
if %i4a%==3 goto colset
if %i4a%==4 goto mapdri
if %i4a%==5 goto help1
if %i4a%==6 goto cnew
if %i4a%==0 (
echo 
goto sof
) ELSE (
echo 
goto sof
)
REM ----Cp Breakdown
REM Initialize Login
:init
if not exist %sft% (
echo [!] No path was specified!
timeout /t 5
goto sof
)
pause

REM End of Login
REM PathsWitch
:path
color 2f
cls
popd
echo Please type in the full path of the server,
echo then press Enter.
echo ( Ex:  E:\ServerFolder\ )
set /P lfi=Path: 
echo %lfi%>%lf%
pause
goto lfd

REM Color Setter
:colset
mode con: cols=40 lines=40
color fc
color -?
echo.
set ccp=x
set /p ccp=New BG,FG: 
if %ccp%==x goto colset
echo 
goto sof

REM MapDrive
:mapdri
mode con: cols=61 lines=10
color 1f
cls
echo This will map a network location to a driveletter.
echo Its main convenience is an easy path location to the server.
echo You can have multiple driveletters that will show up
echo                                          on your computer.
echo.
pause
echo.
echo Default is     A:
set i2a=A:\
set /p i2a=New Driveletter: 
:i2b 
echo The network drive should be something like:
echo \\MyName-PC\MyAwesomeServerOrLocation
set i2b=nul
set /p i2b=Network Drive Path: 
if %i2b%==nul goto i2b
echo.
echo Drive: %i2a%
echo Net Path: %i2b%
echo Take a moment to ensure that this information is correct.
echo It may generate an error if it is not.
timeout -t 10 /NOBREAK
echo.
echo net use %i2a% %i2b%
net use %i2a% %i2b%
echo.
echo.
echo Check to make sure %i2b% exists in "My Computer".
echo.
timeout -t 10
goto sof
REM ---End Cp Breakdown
:help1
mode con: cols=60 lines=10
color 0f
cls
echo Made by shir0tetsuo
echo.
echo Programmed in Notepad Plus Plus
echo This batch was designed to be the all in one alternative
echo to the LANCIn series. This is the first package model.
echo This batch comes with advanced functions to read and
echo write channel files based completely on text.
echo.
pause
echo.
echo What's new is that this batch file was written in a
echo very short time rather than a few weeks.
echo It also has an extremely condensed code.
echo New features have been added using R E M.
echo.
echo.
echo.
pause
echo.
echo GETTING STARTED
echo To get started, browse through your computer to find a
echo suitable text based server folder location.
echo Go through the "New" segment of this program and
echo follow the instructions on screen.
echo Do not be alarmed if some files are generated in
echo a new folder.
echo.
pause
echo.
echo Here is a list of files that will be generated.
echo sv.lsv         Server Name and Exist marker
echo svch.lsv       Server Channel Directory
echo ch0.cht        Server Channel Chat
echo ch-a0.cht      Server Admin Messages
echo ch-m0.cht      Server Channel MOTD
echo ch-a0 TD.log   Discarded Admin Messages
echo ch0 TD.log     Discarded Channel Chats
pause
echo 1.user.u       User Information File
echo 2.user.u       User Private Messages
echo 3.user.k       User Kick File
echo 4.user.k       User Ban File and Description
echo 5.k            Special Maintenance File
echo.
echo.
echo.
pause
echo.
echo GETTING STARTED II
echo Manually set up the share information on the server
echo folder or attatch it to a dropbox folder thats
echo shared among multiple computers or on a private
echo network.
echo Follow the Path segment instructions then login.
echo.
pause
goto sof
REM ---NEW SERVER
:cnew
mode con: cols=60 lines=10
color 6F
if exist %sft% (
echo You are in violation of programming law!
echo You cannot build another server frame on top of another.
timeout /t 5
)
popd
if exist %sft% (
cls
echo FATAL - Servers cannot be editted by batch once made.
echo It may cause collossal damage.   E403.2 E403.3
timeout /t 5 /NOBREAK
exit
)
REM Start Setup
cls
echo.
echo New Server Setup %vm1% (%vm%)
echo.
timeout /t 5
cls
echo.
echo This is the procedure of the setup.
echo.
echo 1. Servername
REM sv.lsv
echo 2. Location
echo 3. Channel Data
echo 4. Channel MOTDs
echo 5. Admins and Moderators
echo 6. Encrypted Channels
pause
goto lfd
REM ---NEW SERVER END
REM ---NEWSTARTER END