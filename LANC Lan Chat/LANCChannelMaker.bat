@echo off
title LANCChannelMaker
color 0a
mode con: cols=90 lines=20 
:ixf
cls
echo LLLLLLLLLLLLLLLLLLLLAAAAAAAAAAAAAAAAAAAAAAANNNNNNNNNNNNNNNNNNNNNNCCCCCCCCCCCCCCCCCCHAT....
echo .   v3.4 Modbox [Setup]                                                                  .
echo .   https://github.com/shir0tetsuo/Zero/tree/master/LANC Lan Chat                        .
echo .                                                                                        .
echo .   Master Configurator. Don't forget to see the readme on the link!                     .
echo .   I am not responsible for ANY loss of data.         1. Begin    2. Give Mod           .
echo ..........................................................................................
set ix=n
set /P ix=$ 
if %ix%==1 goto rs1
if %ix%==2 goto modg
if %ix%==n (
echo Please type a number!
) ELSE (
echo That's not a valid option.
ping localhost -n 2 >nul
goto ixf
)

:modg
echo Blarg
pause
:rs1
cls
echo.
echo LANC Channel Maker
echo.
echo Press any key below to get started.
pause >nul
cls
echo Address to Create LANCX Server (NON-UNP):
echo.
echo Ex.: C:\DropBox 
set dir=
set /p dir=$ "
cd "%dir%"
mkdir LANCX
cd LANCX
cls
:build
set build=
set /p build=Build: 

echo A server exists in this location >"LANCX.txt

echo BUILD: %build% >> avsrvr.dat
echo. >> avsrvr.dat
echo ---------------------------- >> avsrvr.dat
:create
echo Enter an integer for the orom you wish to create. These are the chatrooms.
echo You can extend the MOTD to multiple lines if you use the same filecode.
echo Type Next as CREATE to continue.
set master=0
set /p master=CREATE: 
if %master%==Next goto Next
set MOTD=Welcome!
set /p MOTD=MOTD (Optional): 
echo %MOTD% >> orom-c%master%.txt
if %MOTD%==Welcome! goto create
echo %MOTD% >> orom-m%master%.txt
goto Create

:Next
cls
echo Add Descriptions and Admin Passwords!
echo oromnumber followed by description.
echo Next is still the way out.
echo Requires description.
echo Type Next as oromnu to continue.
set oromnu=0
set /p oromnu=oromnu: 
if %oromnu%==Next goto Adm
set string=Public
set /p string=descr: 
if not exist orom-c%oromnu%.txt goto Er
echo     Channel %oromnu%: %string% >> avsrvr.dat
goto Next

:Adm
cls
echo Add an admin password. Leave blank for none.
set admp=0
set /P admp=Admin: 
if %admp%==0 goto Eol
echo %admp% > admin.txt
goto Eol

:Er
echo Oops! something went wrong.
echo That file code does not exist!
pause
goto Next

:Eol
echo ---------------------------- >> avsrvr.dat
cls
echo Congradulations!
echo Your files have been finalized.
echo.
type avsrvr.dat
echo.
pause
exit