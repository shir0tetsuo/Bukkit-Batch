REM ---------------------------------------------
REM Start of File
@echo off
set location=0
set locf=loc.dat
title LANCOut2
color 0b
set noch=0
set noch2=0
set noch3=0
set ver=2.1.1.0
set adminpermissions=0
echo Hello!
echo [!] R/W ...
if not exist %locf% echo [!] loc.dat missing. Please run the configuration in LANCIn2.bat.
if not exist %locf% ping localhost -n 5 >nul
if not exist %locf% start LANCIn2.bat

echo [!] R/W ...
if exist %locf% (
set /P location=
)<%locf%
if exist %locf% echo [!] R/W ...
cd %location%
if not exist LANCX.txt echo [!] E:404 LANCX Server Path Not Found
if not exist LANCX.txt echo [:] Use pushload to load a UNC location from %locf% .
if not exist LANCX.txt ping localhost -n 5 >nul
REM /////////////////////////////////////////////////////////////////////
REM /////////////////////////////////////////////////////////////////////
REM /////////////////////////////////////////////////////////////////////
REM /////////////////////////////////////////////////////////////////////
REM /////////////////////////////////////////////////////////////////////

:rs1
cls
echo.
echo LANCOut: Local Area Network Chat Output
if not exist LANCX.txt echo [!!] WARN  The specified path does not contain a LANCX server.
echo.
echo         Case Sensitive
echo               1- ---------------
echo                   Color
echo                   Help
echo               2- ---------------
if exist LANCX.txt echo                   Login
if exist %locf% echo                   pushd
if exist %locf% echo                   pushload
echo               3- ---------------
if not exist LANCX.txt echo               [!] Configure
if %noch2%==0 echo                   SilentLogin
if %noch2%==1 echo              [ON] SilentLogin
if %noch3%==0 echo                   console
if %noch3%==1 echo              [ON] console
echo.
set CVCr=er
set /p CVCr=$ 
if %CVCr%==er goto rs1 
if %CVCr%==Color goto colormod
if %CVCr%==Help goto H
if %CVCr%==Login goto runsetname
if %CVCr%==login goto runsetname
if %CVCr%==Configure start LANCIn2.bat
if %CVCr%==pushd goto push
if %CVCr%==pushload goto pushloader
if %CVCr%==console set noch3=1&goto rs1
REM Put EXE when 1.1.40
REM if %CVCr%==Receive start CloudReceive.bat&goto rs1
REM if %CVCr%==OromUtil start CloudWrite.bat&goto rs1
if %CVCr%==SilentLogin set noch2=1&goto rs1

REM ------------------------ Error -----------------------------------
echo.
echo %CVCr% is not an option or was typed incorrectly.
echo You must enter one of the options displayed, case sensitive.
echo.
pause
goto rs1
REM ------------------------------------------------------------------

:colormod
set SSW=err2
:SSWe
cls
echo DESCRIPTION        COL.      CODE
echo Default          :: 0F ::    default
echo Black and Gray   :: 70 ::    lunar
echo Lime             :: A0 ::    lime
echo Virus Red        :: 4C ::    virus
echo Manual                       colorsel
set /p SSW=Color Menu: 
if %SSW%==err2 (
goto SSWe
)
if %SSW%==menu goto reset1
if %SSW%==lime (
color A0
goto SSWe
)
if %SSW%==lunar (
color 70
goto SSWe
)
if %SSW%==default (
color 0F
goto SSWe
)
if %SSW%==virus (
color 4C
goto SSWe
)
if %SSW%==colorsel goto custcol
goto rs1
:custcol
cls
echo.
echo ////////////////////////////////////////////
echo      Enter the color code manually.
echo     Usage: 0F    or    3B    or    98
echo       0 = Black    8 = Gray
echo       1 = Blue     9 = Light Blue
echo       2 = Green    A = Light Green
echo       3 = Aqua     B = Light Aqua
echo       4 = Red      C = Light Red
echo       5 = Purple   D = Light Purple
echo       6 = Yellow   E = Light Yellow
echo       7 = White    F = Bright White
echo.
:coldeny
SET mancol=x
SET /P mancol=Code: 
if %mancol%==back goto rs1
if %mancol%==x (
echo.
echo You have nothing input!
echo.
goto coldeny
)
echo.
echo Your code is: %mancol%
echo.
echo Is the code you entered correct? [ y / n ]
SET confirmcol=y
SET /P confirmcol=Confirm? 
if %confirmcol%==y (
color %mancol%
echo.
echo The scheme has been modified.
echo Type back to go back.
echo.
goto coldeny
)
if %confirmcol%==n (
echo.
echo The scheme was not loaded.
echo Type back to go back.
echo.
goto coldeny
)

:H
cls
echo Made by Ryan Davis 2013.
echo LANCX server must be specified in loc.dat .
echo You need LANCIn2.bat to properly configure.
echo It's pretty easy to understand and stuff!
echo You are welcome sir
pause
goto rs1

:runsetname
cls
set u=Guest
set /p u=Username: 
echo Channel needs to be set.
ping localhost -n 3 >nul
cls
type avsrvr.dat
set c=0
set /p c=Set Channel: 
if not exist orom-c%c%.txt goto redo 

if exist orom-x%c%.txt set pass=0&goto enc1

goto chatbox

:redo
echo An error occured. The chatroom may not exist.
pause
goto runsetname

:chatbox 
REM set /p c=Chatlog path (end it in .txt):
set time=&time /t
if %noch2%==1 goto CHLo
if %noch3%==0 echo [!][%time%] %u% Signed In. >> orom-c%c%.txt
if %noch3%==1 echo [!][CU][%time%] %u% Signed in as a console user. >> orom-c%c%.txt

:CHLo
cls
echo Sending - %u%
echo --- CH: %c% -----------------------------------------------
type orom-c%c%.txt
echo --- CH: %c% -----------------------------------------------
if exist orom-m%c%.txt echo  MOTD:
if exist orom-m%c%.txt type orom-m%c%.txt
if exist orom-m%c%.txt echo.
if exist orom-m%c%.txt echo -----------------------------------------------

echo.
set /p m=Message: 
REM Main Message
if %noch3%==0 echo [%time%] %u%: %m% >> orom-c%c%.txt
if %adminpermissions%==1 (
echo [A][%time%] %u%: %m% >> orom-c%c%.txt
goto solcom
)
if %noch3%==1 echo [CU][%time%] %u%: %m% >> orom-c%c%.txt

if %noch3%==1 goto solcom

echo [:] Anti-Flood
ping localhost -n 2 >nul
goto CHLo

:solcom

if %noch3%==1 set sol=0
set /p sol=Console: 

REM ! commands
REM ///////////////////////////////////////////////////////////////////////////
echo [CU] Checking Command..
if %sol%==!waffles (
echo [!][%time%] %u% ate a bunch of waffles. >> orom-c%c%.txt
goto CHLo
)
if %sol%==!quit (
echo [%time%] %u% Logged Off. >> orom-c%c%.txt
ping localhost -n 2 >nul
goto rs1
)
if %sol%==!exit (
echo [%time%] %u% Logged Off. >> orom-c%c%.txt
ping localhost -n 2 >nul
Goodbye.
ping localhost -n 2 >nul
exit
)

if %sol%==!help (
echo !waffles
echo !fish
echo !list: Displays channel list
echo !help: Displays help
echo !ch: Switches channel
echo !quit: Goes to main menu
echo !exit: Exits the application
echo !disable: Disables Console User till next restart
echo !changeusr: Changes your username.
if exist admin.txt echo !admin: Login to use admin permissions.
if %adminpermissions%==1 echo [A] List of Admin Commands
if %adminpermissions%==1 echo !v: Check build version.
if %adminpermissions%==1 echo !reset: Reset the chatroom and export to a log.
if %adminpermissions%==1 echo !ban: Ban a user by IP or computer name.
pause
goto CHLo
)

if %sol%==!admin goto enc2

if %sol%==!changeusr goto changeusrn

if %sol%==!disable (
set noch3=0
echo [!CU] Console Usage Disabled.
ping localhost -n 4 >nul
goto CHLo
)

if %sol%==!list (
echo.
type avsrvr.dat
echo.
echo.
echo [:] To switch channels, do !ch
pause
goto CHLo
)

if %sol%==!fish goto slap

REM Channel Switching
if %sol%==!ch (
echo.
set c2=0
set /P c2=Channel: 
echo [!] R/W ...
)
if %sol%==!ch (
ping localhost -n 2 >nul
echo [!] %c% --- to --- %c2%
ping localhost -n 2 >nul
if not exist orom-c%c2%.txt (
echo Non-Existent Channel.
ping localhost -n 3 >nul
goto CHLo
)

echo [%time%] %u% switched to channel %c2%. >> orom-c%c%.txt
set c=%c2%
if exist orom-x%c2%.txt goto enc1
goto chatbox
)

REM ///////////////////////////////////////////////////////////////////////////

if %adminpermissions%==1 goto adminsub

REM Channel Switching End
ping localhost -n 2 >nul
goto CHLo

REM ///////////////////////////////////////////////////////////////////////////

:adminsub
echo [A] Checking Admin Subroutine...
if %sol%==!reset (
echo [!] R/W ...
ren orom-c%c%.txt orom-L%c%--%time:~0,2%%time:~3,2%-%DATE:/=%.txt
echo [!] Channel %c% was exported on %time:~0,2%%time:~3,2%-%DATE:/=%.
echo [!!] An admin has reset this chatroom. > orom-c%c%.txt
pause
goto CHLo
)

if %sol%==!v (
echo %ver%
)

ping localhost -n 2 >nul
goto CHLo


REM ///////////////////////////////////////////////////////////////////////////
REM Extra Command References

:slap
set slapee=Another Fish
set /P slapee=Who do you want to slap? 
if %adminpermissions%==0 echo [!][%time%] %u% slapped %slapee% with A Smelly Fish. >> orom-c%c%.txt
if %adminpermissions%==1 echo [!][%time%] Admin %u% slapped %slapee% with A Dank Fishstick. >> orom-c%c%.txt
goto CHLo

REM ///////////////////////////////////////////////////////////////////////////

:enc1
cls
echo This chatroom has a password!
if %noch2%==1 echo [!] SilentLogin was disabled.
echo.
set noch2=0
echo [!] R/W ...
if exist orom-x%c%.txt (
set /P pass=
)<orom-x%c%.txt
echo [!] 
set pass2=1
set /P pass2=PW: 
if %pass2%==%pass% (
echo %pass2% --- %pass% -- Password Correct!
echo.
echo You will be logged in shortly.
ping localhost -n 5 >nul
goto chatbox
)
goto enc1

:enc2
if not exist admin.txt echo [!] No admin permissions available.
if not exist admin.txt ping localhost -n 3 >nul
if not exist admin.txt goto CHLo
echo [!] R/W ...
set admp=nul
if exist admin.txt (
set /P admpr=
)<admin.txt
set /P admp=Pass: 
if %admp%==%admpr% (
echo [!] %admp% --- %admpr% -- Password Correct!
ping localhost -n 3 >nul
set adminpermissions=1
goto CHLo
) ELSE (
echo [!] Incorrect Password!
goto enc2
)

:push
set ipush=0
echo [:] The %locf% will be ignored.
set /P ipush=Enter Pushed Drive Path: 
if %ipush%==0 goto push
echo [!] pushd %ipush% ...
pushd %ipush%
echo [!] R/W ...
ping localhost -n 2 >nul
goto rs1

:pushloader
echo [!] R/W ...
echo [!!] R/W %locf%
if exist %locf% (
set /P location=
)<%locf%
pushd %location%
if exist LANCX.txt echo Server Found!
if not exist LANCX.txt echo E:404
ping localhost -n 2 >nul
goto rs1

REM Extra Console Bit
:changeusrn
set /P u2=Username: 
if %adminpermissions%==1 echo [!][A][%time%] %u% changed their username to %u2%. >> orom-c%c%.txt
if %adminpermissions%==0 echo [!][CU][%time%] %u% changed their username to %u2%. >> orom-c%c%.txt
set u=%u2%
goto CHLo