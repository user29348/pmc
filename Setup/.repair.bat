@echo off
cls
echo ----------------------
echo PortableMC Repair Tool
echo ----------------------
echo.
echo Use this tool to reset
echo all the options in the
echo game without effecting 
echo anything else
echo.
echo.
choice /c yn /m "Repair now?"

if errorlevel 2 goto no
if errorlevel 1 goto yes

:yes
xcopy "D:\PortableMC\Setup\config" "D:\PortableMC\Launcher\Config"/E /I /Y
xcopy "D:\PortableMC\Setup\options.txt" "D:\PortableMC\Launcher\"/E /I /Y
goto end

