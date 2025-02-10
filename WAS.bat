@echo off
:: Check for Admin Privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Admin Privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit
)

:menu
cls
echo ==============================
echo       Activation Menu
echo ==============================
echo 1. Get Windows Activated
echo 2. Get Office Activated
echo 0. Main Menu
echo ==============================
echo Use 0,1 and 2 to select your choice
set /p choice=Enter your choice: 

if "%choice%"=="1" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex; 1"
    goto end
)

if "%choice%"=="2" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex; 2"
    goto end
)

if "%choice%"=="0" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex"
    goto end
)

echo Invalid choice! Try again.
pause
goto menu

:end
exit
