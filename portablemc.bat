@echo off
:mainmenu
cls
color 0f

setlocal
echo.
echo -------------------------------------
echo PortableMC V1.1.14 Made be CreeperDEv  
echo -------------------------------------
echo.
echo This is the PortableMC hub, here you 
echo can manage your installation, worlds
echo and other items as well.
echo.

echo.
echo.


echo Chose an action: --------------------
echo 1  - Manage worlds
echo 2  - Manage mods
echo 3  - Install/Reinstall instance
echo 4  - Delete instance
echo 5  - Repair instance
echo 6  - Uninstall PortableMC
echo x  - Exit
echo l  - Launch using Minecraft Launcher
choice /c 123456xl /n /m "Enter your selection"
if errorlevel 8 goto opt7
if errorlevel 7 goto exit
if errorlevel 6 goto opt6
if errorlevel 5 goto opt5
if errorlevel 4 goto opt4
if errorlevel 3 goto opt3
if errorlevel 2 goto opt2
if errorlevel 1 goto opt1

:Exit
Exit
goto end  
:opt4
call D:\PortableMC\Setup\.nuke.bat
goto mainmenu
:opt5
call D:\PortableMC\Setup\.repair.bat
goto mainmenu
:opt1
call D:\PortableMC\Setup\.worlds.bat
goto mainmenu
:opt7
call D:\PortableMC\Setup\launch.bat
goto mainmenu
:opt6
call D:\PortableMC\Setup\uninstall.bat
goto mainmenu
:opt2
call D:\PortableMC\Setup\mods.bat
goto mainmenu

:opt3
call D:\PortableMC\Setup\reinstall.bat
goto mainmenu
pause
endlocal
