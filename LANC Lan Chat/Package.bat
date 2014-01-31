@echo off
set cols=50
set lines=15
mode con: cols=%cols% lines=%lines%
rem ShadeBoxAt 1 1 15 50 3
rem ChangeColor 0 7
rem ShadeBoxAt 2 2 13 48 2
rem ChangeColor 12 0
rem ShadeBoxAt 7 24 1 1 2
rem ChangeColor 10 0
rem ShadeBoxAt 7 25 1 1 2
rem ChangeColor 9 0
rem ShadeBoxAt 8 24 1 1 2
rem ChangeColor 14 0
rem ShadeBoxAt 8 25 1 1 2
rem ChangeColor 4 12
rem ShadeBoxAt 6 23 2 1 3
rem ShadeBoxAt 6 24 1 1 3
rem ChangeColor 2 10
rem ShadeBoxAt 6 25 1 2 3
rem ShadeBoxAt 7 26 1 1 3
rem ChangeColor 1 11
rem ShadeBoxAt 8 23 2 1 3
rem ShadeBoxAt 9 24 1 1 3
rem ChangeColor 6 14
rem ShadeBoxAt 9 25 1 2 3
rem ShadeBoxAt 8 26 1 1 3
rem ChangeColor 7 0
rem ShadeBoxAt 5 22 1 6 1
rem ShadeBoxAt 6 27 5 1 1
rem ShadeBoxAt 6 22 5 1 1
rem ShadeBoxAt 10 23 1 4 1
rem ShadeBoxAt 4 30 1 3 1
rem ShadeBoxAt 2 30 1 3 1
rem ShadeBoxAt 3 30 3 1 1
rem ShadeBoxAt 3 32 1 1 1
rem ShadeBoxAt 6 30 1 3 1
rem ChangeColor 8 0
rem ShadeBoxAt 2 34 1 4 1
rem ShadeBoxAt 4 34 1 4 1
rem ShadeBoxAt 6 34 1 4 1
rem ShadeBoxAt 5 34 1 1 1
rem ShadeBoxAt 3 37 1 1 1
rem ShadeBoxAt 2 39 5 1 1
rem ShadeBoxAt 2 40 1 3 1
rem ShadeBoxAt 3 42 4 1 1
rem ShadeBoxAt 6 40 1 2 1
rem ShadeBoxAt 4 40 1 2 1
rem ShadeBoxAt 12 2 1 48 1
rem ShadeBoxAt 13 1 1 50 1
rem ShadeBoxAt 14 1 1 50 1
rem ShadeBoxAt 9 1 1 21 1
rem ShadeBoxAt 9 28 1 18 1
rem ChangeColor 12 11
rem ShadeBoxAt 2 3 4 1 3
rem ShadeBoxAt 5 4 1 2 3
rem ShadeBoxAt 2 6 4 1 3
rem ShadeBoxAt 2 7 1 3 3
rem ShadeBoxAt 3 9 3 1 3
rem ShadeBoxAt 4 7 1 2 3
rem ShadeBoxAt 2 10 4 1 3
rem ShadeBoxAt 3 11 1 1 3
rem ShadeBoxAt 4 12 1 1 3
rem ShadeBoxAt 5 13 1 1 3
rem ShadeBoxAt 2 14 4 1 3
rem ShadeBoxAt 7 2 1 4 3
rem ShadeBoxAt 8 2 3 1 3
rem ShadeBoxAt 10 3 1 3 3
rem ShadeBoxAt 7 7 4 1 3
rem ShadeBoxAt 7 10 4 1 3
rem ShadeBoxAt 9 8 1 2 3
rem ShadeBoxAt 7 12 4 1 3
rem ShadeBoxAt 7 13 1 3 3
rem ShadeBoxAt 8 15 3 1 3
rem ShadeBoxAt 7 17 1 4 3
rem ShadeBoxAt 8 18 3 1 3
rem ShadeBoxAt 9 13 1 2 3
rem ChangeColor 0 15
rem Locate 25 1
ping localhost -n 2 >nul
REM Splash End
set ccp=4f
color %ccp%
REM ---Variables
REM Serverside Detection
set sft=sv.lsv
set EjectFile=5.k
set admin=0
REM Location File Data
set lf=loc.dat
set lfi=0
set pullhome=0
set sfa=admin.u
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
echo   Welcome!  
timeout /t 5
cls
REM First Use Lines
if not exist %lf% (
echo 
echo First time use. You will be required to specify
echo the path of the public folder, or create a new
echo server with the in-program segment that follows
timeout /T 15
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
cls
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
echo                 6. New Server
)
rem ChangeColor 12 0
rem ChangeColor 15 4
rem ShadeBoxAt 1 1 1 50 3
rem ShadeBoxAt 14 1 1 50 1

rem Locate 25 1
REM Menu Select ---------------------------------------------------
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
cls
REM INCOMPLETE///////////////////////////////////////////////////////
if not exist %sft% (
echo [!] No path was specified!
timeout /t 5
goto sof
)
cls
mode con: cols=50 lines=40
set u0=0
set /p u0=Username: 
if %u0%==0 (
echo 
goto init
)
if exist 1.%u0%.u (
set pullhome=inithome
goto IDU
)
if not exist 1.%u0%.u (
set ucode=0
set consu=0
set admin=0
set moder=0
)
:inithome
cls
color %ccp%
mode con: cols=50 lines=40
echo You have been logged in.
timeout /t 5

REM Menu Prompt login
echo Output, Input, Console Mode, Account -- Change pw


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
echo %lfi% > %lf%
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
REM Channel number: %CHAN%   Username: %u0%   admin
pause
echo 1.user.u       User Information File
echo 2.user.u       User Private Messages
echo 3.user.k       User Kick File
echo 4.user.k       User Ban File and Description
echo 5.k            Special Maintenance File
echo ch0.k          Chat Passcode
echo admin.u        Admin File
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
echo 4. Admins and Moderators
echo.
pause
cls
echo STAGE I
set i3a=My Server
echo Specify a name for your new server.
echo Default: My Server
set /p i3a=$ 
cls
echo STAGE II
echo We will make a directory in
echo the same folder you have your program running in.
echo You can move and rename the server folder once
echo complete. It is recommended that you run the
echo Map Network Drive segment when running on LAN.
echo.
pause
mkdir TxtServer
cd TxtServer
echo %i3a% > %sft%
REM Channel Math --------
cls
echo STAGE III
echo You are finally entering the more complex
echo stage of the installation!
:i3aa
set /a i3c=3
echo How many channels does your server have?
echo Min 2 Max 8
echo Default is 3.
set /p i3c=$ 
if %i3c% LEQ 1 (
echo Sorry! You can't have less than 2 channels.
goto i3aa
)
if %i3c% GEQ 9 (
echo Sorry! You can't have more than 8 channels.
goto i3aa
)
REM Channel Math Continued

set /a i6a=1
REM i6a will continue to i6b
set /a i6b=%i3c%

:i3cb
REM CH Name
REM i3cn# i3cm# Variables
set i7n%i6a%=Chatroom
set i7m%i6a%=Welcome to my server!
set i7x1=N
set i7x2=N
set i7x3=N
set i7x4=N
set i7x5=N
set i7x6=N
set i7x7=N
set i7x8=N
REM N - Chatroom Variable
REM M - MOTD Variable
REM X - S/P Switch (S for Set and P for Protect)
REM E - Encrypted Element
REM   N         M         X        E
REM i7n1      i7m1      i7x1*
REM i7n2      i7m2      i7x2*
REM i7n3      i7m3      i7x3*
REM i7n4      i7m4      i7x4*
REM i7n5      i7m5      i7x5*
REM i7n6      i7m6      i7x6*
REM i7n7      i7m7      i7x7*
REM i7n8      i7m8      i7x8*
echo.
set /p i7n%i6a%=Channel %i6a% Name: 
set /p i7m%i6a%=Channel %i6a% MOTD: 
set /p i7x%i6a%=Enter P to Protect: 
REM Bug
if %i6a% GEQ %i6b%+1 goto skipr
REM Element X Array
if %i7x1%==P goto Passcode
if %i7x1%==p goto Passcode
if %i7x2%==P goto Passcode
if %i7x2%==p goto Passcode
if %i7x3%==P goto Passcode
if %i7x3%==p goto Passcode
if %i7x4%==P goto Passcode
if %i7x4%==p goto Passcode
if %i7x5%==P goto Passcode
if %i7x5%==p goto Passcode
if %i7x6%==P goto Passcode
if %i7x6%==p goto Passcode
if %i7x7%==P goto Passcode
if %i7x7%==p goto Passcode
if %i7x8%==P goto Passcode
if %i7x8%==p goto Passcode
:bump
set i7x%i6a%=S
ping localhost -n 2 >nul
set /a i6a=%i6a%+1
if %i6a% GEQ %i6b%+1 (
goto skipr
)
REM Once last variable equals over, goto skipr
goto i3cb
REM if exist chx%i6a%
REM ENC---------------------------------------------------
REM Element E
:Passcode
cls
echo Protecting Channel %i6a%
echo Please enter a passcode.
rem GetMasked
echo %result% >> ch%i6a%.k
goto bump
:skipr
REM Dump Files II
set outlsv=svch.lsv
echo ------------------ b. %vm% > %outlsv%
echo %i3a% >> %outlsv%
echo. >> %outlsv%
echo. >> %outlsv%
REM Reset Counter
set i6a=1
echo CH %i6a% >> %outlsv%
:i7
REM Element Number, N, M
REM i7n,m,x1
if %i6a%==1 (
echo   %i7n1% >> %outlsv%
echo %i7m1% >> ch-m%i6a%.cht
)
REM i7n,m,x2
if %i6a%==2 (
echo   %i7n2% >> %outlsv%
echo %i7m2% >> ch-m%i6a%.cht
)
REM i7n,m,x3
if %i6a%==3 (
echo   %i7n3% >> %outlsv%
echo %i7m3% >> ch-m%i6a%.cht
)
REM i7n,m,x4
if %i6a%==4 (
echo   %i7n4% >> %outlsv%
echo %i7m4% >> ch-m%i6a%.cht
)
REM i7n,m,x5
if %i6a%==5 (
echo   %i7n5% >> %outlsv%
echo %i7m5% >> ch-m%i6a%.cht
)
REM i7n,m,x6
if %i6a%==6 (
echo   %i7n6% >> %outlsv%
echo %i7m6% >> ch-m%i6a%.cht
)
REM i7n,m,x7
if %i6a%==7 (
echo   %i7n7% >> %outlsv%
echo %i7m7% >> ch-m%i6a%.cht
)
REM i7n,m,x8
if %i6a%==8 (
echo   %i7n8% >> %outlsv%
echo %i7m8% >> ch-m%i6a%.cht
)
REM Create File
echo [%time%] Hello, World! > ch%i6a%.cht
set /a i6a=%i6a%+1
if %i6a% GEQ %i6b%+1 goto skipr2
echo CH %i6a% >> %outlsv%
goto i7
:skipr2
REM Admin and Moderator Shit
cls
echo Your chatroom channels have been set.
echo STAGE IV
REM 1.user.u
echo You will now create your base user.
echo It will be given the permissions of a moderator.
set um=0
set /p um=Username: 
if %um%==0 (
echo This cannot be left blank!
timeout /t 5
goto skipr2
)
echo Please type in a password.
rem GetMasked
echo.
echo %result% > 1.%um%.u
echo 1 >> 1.%um%.u
echo 1 >> 1.%um%.u
echo 1 >> 1.%um%.u
echo Your profile has been created.
echo Welcome, %um%.
timeout /t 5
cls
echo You can give admin permissions to others
echo via the console. They must be registered
echo users. Registration can occur when the
echo user enables the console function and
echo registers.
pause
goto lfd

REM ---END of Setup


:IDU
if %pullhome%==0 set pullhome=sof
if 1==1 (
set /p ucode=
set /p consu=
set /p admin=
set /p moder=
)<1.%u0%.u
if %pullhome%==inithome goto pc0
goto %pullhome%
REM PC0 ---------------------



:pc0
mode con: cols=22 lines=10
echo PASSCODE INITIALIZING
REM puller 1: User Login, puller 2: Channel Login, Puller 3: Admin Login
set /a ecodef=5
:pc1
if %pullhome%==inithome (
set ecode=%ucode%
)
REM Not Existant Yet
if %pullhome%==channelhome (
set /p ecode=
)<ch%chan%.k
REM Not Existant Yet
if %pullhome%==adminhome (
set /p ecode=
)<%sfa%
REM Continued
if %ecodef%==0 (
cls
echo Error!
echo You have failed to
echo enter the passcode.
timeout /t 10
exit
)
echo.
rem ChangeColor 12 0
rem ShadeBoxAt 1 1 10 22 3
rem ChangeColor 4 0
rem ShadeBoxAt 2 2 7 20 3
echo Enter the passcode
rem ShadeBoxAt 4 5 1 1 3
rem Locate 25 1
REM Enter Password HERE-------------
rem GetMasked
echo.
if %result% EQU %ecode% goto pceof
if %result% NEQ %ecode% (
echo 
set /a ecodef=%ecodef%-1
goto pc1
)
:pceof
if %pullhome%==adminhome (
set admin=1
)
goto %pullhome%
REM ---NEW SERVER END
REM ---NEWSTARTER END















