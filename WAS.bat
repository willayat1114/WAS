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
echo 3. Install Office
echo 0. Main Menu
echo ==============================
set /p choice=Enter your choice: 

if "%choice%"=="1" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex; 1"
    goto end
)

if "%choice%"=="2" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex; 2"
    goto end
)

if "%choice%"=="3" (
    echo Installing Office...
    cd /d "%~dp0Office"
    if exist ODT.exe (
        ODT.exe
        echo ODT.exe executed successfully.
    ) else (
        echo ERROR: ODT.exe not found!
        pause
        goto menu
    )

    if exist setup.exe (
        echo Running Office Setup...
        setup.exe /configure configuration.xml
    ) else (
        echo ERROR: setup.exe not found!
        pause
        goto menu
    )
    echo Office installation complete!
    pause
    goto menu
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
