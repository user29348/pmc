@echo off
echo ---------------------------------
echo PortableMC Patch 1.1.12 to 1.1.13
echo ---------------------------------
echo.
echo This program will patch some
echo bugs found in a previous version: 
echo.
echo - Resolutioncontrol.json is not
echo   formatted correctly
echo - Fix launcher running on the
echo   users's desktop
echo.
pause

xcopy "D:\Patch-1.1.13\setup\resolutioncontrol.json" "D:\PortableMC\Setup\config\" /Y

xcopy "D:\Patch-1.1.13\setup\resolutioncontrol.json" "D:\PortableMC\Launcher\config\" /Y

xcopy "D:\Patch-1.1.13\setup\launch.bat" "D:\PortableMC\Setup\" /Y

echo Done

pause
start /b "" cmd /c del "D:\Patch-1.1.13"&exit

