REM ---------------------------------------------
REM Start of File
@echo off
set location=0
set locf=loc.dat
title LANCOut2
color 0b
set noch=0
set noch2=0
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
echo               2- ---------------
if exist LANCX.txt echo                   Login
echo               3- ---------------
if not exist LANCX.txt echo               [!] Configure
if %noch2%==0 echo                   SilentLogin
if %noch2%==1 echo              [ON] SilentLogin
echo.
set CVCr=er
set /p CVCr=$ 
if %CVCr%==er goto rs1 
if %CVCr%==Color goto colormod
REM if %CVCr%==Help goto H
REM if %CVCr%==Login goto runsetname
if %CVCr%==Configure start LANCIn2.bat
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