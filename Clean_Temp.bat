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

:: Clean the current user's %temp% folder
echo Deleting user temp files: %temp%
rd /s /q "%temp%"
mkdir "%temp%"
echo User temp files have been cleaned!

:: Clean the system %windir%\Temp folder
echo Deleting system temp files: %windir%\Temp
rd /s /q "%windir%\Temp"
mkdir "%windir%\Temp"
echo System temp files have been cleaned!

:: All done
echo All temporary folders have been cleaned successfully!
exit
