@echo off
color a

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Administrator privileges are required. Restarting the script...
    :: Elevate privileges and restart the script
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Cleaning files in the %temp% folder...
echo The current user's temporary folder path is: %temp%
echo Deleting...

rd /s /q "%temp%"
mkdir "%temp%"

echo The %temp% folder has been cleaned!

set systemtemp=%windir%\Temp
echo Cleaning the system temporary folder: %systemtemp%
rd /s /q "%systemtemp%"
mkdir "%systemtemp%"

echo All temporary folders have been cleaned!

exit
