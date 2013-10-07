@echo off
color 0e
set fsr=0
set location=0
set locf=loc.dat
set noch=2
echo [!] ::: Noch = %noch% (Load Static) :::
title LANCIn2: Interface
echo                                          [!] LANCIn2 Start!
ping localhost -n 2 >nul

REM runonce

echo [!] R/W LANCIn.dat ...
if not exist LANCIn.dat (
echo [!] LANCIn.dat will be generated in the same folder.
echo.
echo [!] First run. Welcome!
set fsr=1
ping localhost -2 >nul
(echo %noch%)>"LANCIn.dat
)
set SettingsF=LANCIn.dat

if %fsr%==1 goto firstrunm

:Load
echo [!!] R/W %settingsF%
if exist %settingsF% (
set /P noch=
)<%settingsF%
:Load2
echo [!] R/W ...
echo.
echo ========================================================================
if %noch%==2 echo [:] You must set the path of the LANCX folder before usage.
if %noch%==1 echo [!] ::: Noch = %noch% :::
if %noch%==1 echo [:] Welcome!
if exist loc.dat echo [:] A location save was discovered. 
if exist loc.dat echo     To quickly load the location last saved, type load at the menu.
if not exist LANCX.txt echo [!!] WARN  The specified path does not contain a LANCX server.
:skipwarn
echo.
pause
goto rs1

:rs1
cls
echo.
echo LANCIn2: Interface
if not exist LANCX.txt echo [!!] WARN  The specified path does not contain a LANCX server.
echo.
echo.
echo         Case Sensitive
echo               1- --------- RUN -
if exist LANCX.txt echo                   Login
if exist loc.dat echo                   Load
if exist LANCX.txt echo                   colconfig
if exist LANCOut.bat echo                   LANCOut
if not exist LANCX.txt echo               2- ------ CONFIG -
if not exist LANCX.txt echo               [:] Configure

echo.
echo             Restart the LANCIn2.bat file if you would like
echo             A. A different channel
echo             B. Start LANCOut from within this batch
echo.
set i0=0
:rsl
set /P i0=$ 
if %i0%==0 goto rsl
if %i0%==Configure goto Configure
if %i0%==configure goto Configure
if %i0%==colconfig goto colconfig
if %i0%==Login goto skpdc
if %i0%==login goto skpdc
if %i0%==load goto loadloc
if %i0%==Load goto loadloc
if %i0%==LANCOut ( 
if exist LANCOut.bat start LANCOut.bat
goto rsl
)
if %i0%==lancout (
if exist LANCOut.bat start LANCOut.bat
goto rsl
)
echo Error (E2) Invalid Option
ping localhost -n 2 >nul
goto rs1

REM Loc

:Configure
cls
echo Set the full path of the LANCX folder.
set noch=1
set /P location=
if not exist loc.dat (
echo [!] Saving %locf% ...
(echo %location%)>"%locf%
echo [!] Saved.
ping localhost -n 2 >nul
)
if exist loc.dat (
(echo %location%)>"%locf%
)
echo [!] R/W %location%
cd "%location%"
echo [!] Running %locf% fix ...
echo [!] Ignore the error below ...
ping localhost -n 3 >nul
echo [!] R/W ...
if exist LANCX.txt del loc.dat
goto load2

:colconfig
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
if %mancol%==options goto options
if %mancol%==menu goto reset1
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
:skpdc
cls
echo. 
if not exist LANCX.txt (
echo The path you have specified is not a valid server folder.
ping localhost -n 3 >nul
goto rs1
)
type avsrvr.dat
set c=1
set /p c=Set Channel: 
if not exist orom-c%c%.txt goto redo 
set lag=800
set /p lag=Refresh lag in miliseconds (def 800 always above 500): 
:A
cls
echo CloudReceive
echo --- CH: %c% ----------------------------------------------
type orom-c%c%.txt
if exist orom-m%c%.txt echo --- CH: %c% ----------------------------------------------
if exist orom-m%c%.txt echo  MOTD:
if exist orom-m%c%.txt type orom-m%c%.txt
if exist orom-m%c%.txt echo ----------------------------------------------------------
PING 1.1.1.1 -n 1 -w %lag% >NUL
goto A

:firstrunm
echo                   This is the Local Area Network Chat: Interface, 2.0.
echo                   Follow the instructions on the screen and ignore R/W
echo                   warnings. A %settingsF% file will be generated   1KB
echo                   with a single digit value (Noch).
echo                   Additionally, A %locf% file will be generated
echo                   containing the last known location that you can
echo                   quickly load on startup. The %locf% file can also
echo                   be used in LANCOut2.
echo.
goto load

:loadloc
echo [!] R/W %settingsF% ...
if not exist LANCIn.dat echo [:] The noch was not changed.
if exist %settingsF% set noch=1
if exist %settingsF% (echo %noch%)>"LANCIn.dat
echo [!] ::: Noch = %noch% :::
echo [!!] R/W %locf% ...
if exist %locf% (
set /P location=
)<%locf%
cd %location%
if exist LANCX.txt echo "%location%" loaded.
if not exist LANCX.txt echo "%location%" was loaded, but the path cannot be used.
ping localhost -n 5 >nul
goto rs1