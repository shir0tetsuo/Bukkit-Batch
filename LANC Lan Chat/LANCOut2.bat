REM ---------------------------------------------
REM Start of File
@echo off
title CloudParty Voice
color 0b
set build=dev2
set noch=0
set noch2=0
:rs1
cls
echo CloudParty Voice %build%
echo.
if %noch%==0 echo The chdir address must be specified.
if %noch%==0 echo Without chdir containing avsrvr.dat and at least 1 orom-c# file,
if %noch%==0 echo this application will be unusable. Go to Configure for details.
if %noch%==0 echo Externals cannot be launched within program once directory parameters set.
echo.
echo         Case Sensitive
echo               1- ---------------
echo                   Color
echo                   Help
echo               2- ---------------
echo                   Login
if %noch%==0 echo                   Receive
if %noch%==1 echo                X  Receive (Cannot be used after Configuration set)
echo               3- ---------------
if %noch%==0 echo               [!] Configure
if %noch%==1 echo                   Configure
if %noch2%==0 echo                   SilentLogin
if %noch2%==1 echo                   SilentLogin [ON]
echo               4- ---------------
if %noch%==0 echo                   OromUtil
if %noch%==1 echo                X  OromUtil (Cannot be used after Configuration set)
echo.
echo         You cannot change the channel
echo         once logged in.
echo.


set CVCr=er
set /p CVCr= CVCR: 
if %CVCr%==er goto rs1 
if %CVCr%==Color goto colormod
if %CVCr%==Help goto H
if %CVCr%==Login goto runsetname
if %CVCr%==Configure goto configlines
REM Put EXE when 1.1.40
if %CVCr%==Receive start CloudReceive.bat&goto rs1
if %CVCr%==OromUtil start CloudWrite.bat&goto rs1
if %CVCr%==SilentLogin set noch2=1&goto rs1

REM ------------------------ Error -----------------------------------
echo.
echo %CVCr% is not an option or was typed incorrectly.
echo You must enter one of the options displayed, case sensitive.
echo.
pause
goto rs1
REM ------------------------------------------------------------------

:configlines
set noch=1
cls
echo Please enter the full address to your LAN's chdir.
echo Because of this build, this is required in order to run this program properly.
echo You will need to reset if you have not entered an address.
echo If you do not enter the correct address, this application will crash.
echo.
echo Do not put quotation marks in the address.
echo Examples of a proper address:
echo C:\Users\Nightdelsol\Dropbox\CloudParty\chdir
echo \\computername\SharedDocs\chdir
echo.
REM Future Project add if exist line for avsrvr.dat
set ctweak=
set /p ctweak=Address: 
cd "%ctweak%"
if not exist avsrvr.dat echo avsrvr.dat Not Found
if not exist avsrvr.dat pause
if not exist avsrvr.dat goto configlines
goto rs1

:colormod
REM --------------------
REM Color
cls
echo Enter the color theme code.
echo.
echo Default
echo Bluescreen
REM --- BLUESCREEN ---
set cval=er
set /p cval= CVCR:COLOR: 
if %cval%==er goto rs1 
if %cval%==Bluescreen goto col1
if %cval%==Default goto col2
:col1
color 1f
goto rs1
REM --- OFF ---
:col2
color 0b 
goto rs1
echo.
echo %cval% is not an option or was typed incorrectly.
echo You must enter one of the options displayed, case sensitive.
echo.
pause
goto rs1

:H
cls
echo Made by Ryan Davis, 2012.
echo For LAN and online cloud syncs like Dropbox and Google Drive.
echo Perfect for LAN, too!
echo PROTOTYPE ONLY.
echo.
echo BAN WARNING
echo.
echo Logs are checked daily.
echo This is a PLURR zone. Look it up if you
echo don't know what it is.
echo.
echo Your IP may be banned without notice.
echo.
pause
cls
echo Type "Receive" in the main menu to start the updater box.
echo This is required if you want to have updates.
echo Note that you must manually close this program
echo with the X at the top right of the window.
pause
goto rs1

:runsetname
cls
set u=User
set /p u=Username: 
echo Channel needs to be set.
if %noch%==1 goto skpdc
cd "C:\Users\Nightdelsol\Dropbox\CloudParty\chdir"
:skpdc
echo.
type avsrvr.dat
set c=1
set /p c=Set Channel: 
if not exist orom-c%c%.txt goto redo 
goto chatbox

:redo
echo An error occured. The chatroom may not exist.
pause
goto runsetname

:chatbox 
REM set /p c=Chatlog path (end it in .txt):
set time=&time /t
if %noch2%==1 goto CHLo
echo [%build%][%time%] %u% Signed In. >> orom-c%c%.txt

:CHLo
cls
echo CloudVoice - %u%
echo --- CH: %c% -------------------------------------------- %build% --
type orom-c%c%.txt
echo --- CH: %c% -------------------------------------------- %build% --
if exist orom-m%c%.txt echo  MOTD:
if exist orom-m%c%.txt type orom-m%c%.txt
if exist orom-m%c%.txt echo ----------------------------------------------------------

echo.
set /p m=Message: 
echo [%time%] %u%: %m% >> orom-c%c%.txt
goto CHLo



