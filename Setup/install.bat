@echo off
color 70
echo ---------------------------------------
echo PortableMC v2.0 Setup
echo ---------------------------------------
echo.
echo Made by CreeperDev 
echo.
echo.
echo Looks like your installing this for
echo the first time. Follow these steps 
echo to get PortableMC installed and 
echo running!
echo.

pause
echo What will happen:
echo - You will initiate the install task
echo   - Online: Uses network to install
echo     a live, ready-to-go game.
echo - A new file called "launch" or 
echo   "launch.bat" will be created
echo   ONLY USE THIS LAUNCHER AS THE MAIN
echo   ONE WILL NOT SHOW YOUR INSTALLATION
echo.


choice /c yn /m "Do you want to install now?"
if errorlevel 2 goto offline
if errorlevel 1 goto yes

:yes

IF NOT EXIST "D:\PortableMC\Setup\launcherpreset.zip" (
    echo Downloading assets...
curl -L -o "d:/PortableMC/Setup/launcherpreset.zip" "https://www.dropbox.com/scl/fi/lzpfi62vjae7ijt325ejh/launcherpreset.zip?rlkey=eglwserk6iu0yrvn7i9n1jyi5&st=z1toj08w&dl=1"
) 

echo Extracting...
powershell -command "Expand-Archive -Force 'D:\PortableMC\Setup\launcherpreset.zip' 'D:\PortableMC\Launcher\'"
xcopy /r "D:\PortableMC\Setup\launch.bat" "D:\PortableMC\"
pause
echo This file will now self destruct and is replaced by "reinstall", a tool that will both delete and reinstall PortableMC
echo.
echo m i n c e r a f t   e

pause
cmd /c xcopy "D:\PortableMC\Setup\reinstall.bat" "D:\PortableMC\"
cmd /c del "%~f0"

pause

goto end


:offline

pause

echo m i n c e r a f t   e

pause

goto end


