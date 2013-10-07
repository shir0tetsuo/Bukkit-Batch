@echo off
title LANCChannelMaker
color 0a

:rs1
cls
echo.
echo LANC Channel Maker
echo.
echo Press any key below to get started.
pause >nul
cls
echo Address to Create LANCX Server (No Quotes):
echo.
echo Ex.: P:\DropBox 
set dir=
set /p dir=$ 
cd "%dir%"
mkdir LANCX
cd LANCX
cls
:build
set build=
set /p build=Build: 
set build=%X%

echo A server exists in this location >"LANCX.txt

echo BUILD: %build% >> avsrvr.dat
echo No build sides are available >> avsrvr.dat
echo. >> avsrvr.dat
echo USE NUMBER IN BRACKET AS CHANNEL >> avsrvr.dat
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
echo Add Descriptions!
echo oromnumber followed by description.
echo Next is still the way out.
echo Requires description.
echo Type Next as oromnu to continue.
set oromnu=0
set /p oromnu=oromnu: 
if %oromnu%==Next goto Eol
set string=Public
set /p string=descr: 
if not exist orom-c%oromnu%.txt goto Er
echo     Channel %oromnu%: %string% >> avsrvr.dat
goto Next

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