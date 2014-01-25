@echo off
mode con: cols=48 lines=20
color 3F
title 
echo ------------------------------------------------
echo This program was designed to give the LANC user
echo a path in which the LANC programs can use.
echo ------------------------------------------------
echo.
echo ------------------------------------------------
echo What this program does
echo.
echo Exactly what it's named to do. Map a network
echo drive so that the LANCIn and LANCOut programs
echo can detect the batch-text local area net chat.
echo ------------------------------------------------
pause
cls
echo ------------------------------------------------
echo Type in the media server path.
set /P UNP=\\
:rdl
echo Type in the drive letter you wish to use.
set DL=C
set /P DL=:::
if exist %DL% goto rdl
if exist %DL%:\ goto rdl
cls
echo MND will use \\%UNP% as the path for %DL%:\.
pause
ping localhost -n 2 >nul
echo Continueing in 3...
ping localhost -n 2 >nul
cls
echo 2...
ping localhost -n 2 >nul
cls
echo 1...
ping localhost -n 2 >nul
net use %DL%: \\%UNP%
net use
pause
exit