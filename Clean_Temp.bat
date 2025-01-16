@echo off
color a
:: Check for administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Administrator privileges are required. Restarting the script...
    :: Elevate privileges and restart the script
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Cleaning all temporary files...

:: Delete all files and subfolders in the current user's %temp% folder
echo Deleting user temp files: %temp%
rd /s /q "%temp%"
mkdir "%temp%"

:: Delete all files and subfolders in the %localappdata%\temp folder
echo Deleting local temp files: %localappdata%\Temp
rd /s /q "%localappdata%\Temp"
mkdir "%localappdata%\Temp"

:: Delete all files and subfolders in the system %windir%\temp folder
set systemtemp=%windir%\Temp
echo Deleting system temp files: %systemtemp%
rd /s /q "%systemtemp%"
mkdir "%systemtemp%"

:: Additional cleanup for %userprofile%\Local Settings\Temp
if exist "%userprofile%\Local Settings\Temp" (
    echo Deleting local settings temp files: %userprofile%\Local Settings\Temp
    rd /s /q "%userprofile%\Local Settings\Temp"
    mkdir "%userprofile%\Local Settings\Temp"
)

echo Cleanup completed!
exit
