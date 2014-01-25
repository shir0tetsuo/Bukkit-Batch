@echo off
set lvn=0.9.1a
title LANC Drive Letter Pusher
mode con: cols=48 lines=20
color 3F
REM This program is only to be used by a Dropbox or local disk to cloud equivalent.
REM When the computer restarts, this temporary drive letter will be erased.
REM This is a useful program with users having long paths and works with the other
REM LANC applications as the UDP path is automatically detected within it.
echo.
echo.
echo.
echo.
echo %lvn%
echo ------------------------------------------------
echo          Coded by Ryan Davis, Dec 2013
echo ------------------------------------------------
ping localhost -n 3 >nul
echo.
:PEDL
echo Please enter a drive letter you want to mount a
echo        *LOCAL* location to.
echo                                        Ex.: N
echo                                       (Def: N)
echo.
set newDrive=N
set /P newDrive=Letter: 
if exist %newDrive%:\ (
echo Unfortunately, the drive %newDrive%:\ already exists.
echo You will need to specify a new drive letter in
echo order to continue with this batch operation.
pause
cls
goto PEDL
)
:cp0
cls
echo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo Are you sure you want to mount a location to
echo the %newDrive%:\ drive?
echo.
set ndc=n
set /P ndc=(Y/N): 
if %ndc%==n goto cp2
if %ndc%==N goto cp2
if %ndc%==y goto cp1
if %ndc%==Y goto cp1 
goto cp0
:cp2
cls
echo Drive %newDrive%:\ will not be mounted.
ping localhost -n 2 >nul
echo Press any key to terminate the program.
pause >nul
exit


:cp1
cls
echo '########::'########::'####:'##::::'##:'#######
echo  ##.... ##: ##.... ##:. ##:: ##:::: ##: ##.....
echo  ##:::: ##: ##:::: ##:: ##:: ##:::: ##: ##:::::
echo  ##:::: ##: ########::: ##:: ##:::: ##: ######:
echo  ##:::: ##: ##.. ##:::: ##::. ##:: ##:: ##...::
echo  ##:::: ##: ##::. ##::: ##:::. ## ##::: ##:::::
echo  ########:: ##:::. ##:'####:::. ###:::: #######
echo ........:::..:::::..::....:::::...:::::........
echo         :::'######::'########:'########:
echo         ::'##... ##: ##.....::... ##..::
echo         :: ##:::..:: ##:::::::::: ##::::
echo         ::. ######:: ######:::::: ##::::
echo         :::..... ##: ##...::::::: ##::::
echo         ::'##::: ##: ##:::::::::: ##::::
echo         ::. ######:: ########:::: ##::::
echo         :::......:::........:::::..:::::
echo :::::::::::::::::::::::::::::::::::::::::::::::
echo.
:rmd
ping localhost -n 2 >nul
echo Please type in the full path of the location
echo to mount to %newDrive%:\
echo.
echo.
echo.
set /P ndpp=$ 
if not exist %ndpp% (
echo.
echo.
goto rmd
)
cls
echo.
echo.
echo ////////////////////////////////////////////////
echo   From your local disk, the path will be used:
echo     %ndpp%
echo ////////////////////////////////////////////////
echo It will be mounted to the %newDrive%:\ drive.
ping localhost -n 3 >nul
cls
echo.
echo.
echo ////////////////////////////////////////////////
echo   %newDrive%:\ is being mounted ...
subst %newDrive%: "%ndpp%"
echo ////////////////////////////////////////////////
pause