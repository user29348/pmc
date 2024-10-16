@echo off
color 70
cls
echo ---------------------------------------
echo PortableMC v2.0 Install/Reinstall
echo ---------------------------------------
echo.
echo Made by CreeperDev 
echo.
echo.
echo Installing/Reinstalling will wipe the
echo instance (besides portablemc backups)
echo.
echo What will happen:
echo - You will initiate the install task
echo   this will take a while but make sure
echo   to keep this tab active
echo - Please use the "launch usnig mine-
echo   craft launcer" option in portablemc.bat
echo   or else the instance will not show


choice /c yn /m "Do you want to install?"
if errorlevel 2 goto offline
if errorlevel 1 goto yes

:yes
echo Deleting Mods, Figs, and basically everything else in this directory...
echo.
del /q "D:\PortableMC\Launcher\*.*"

del  "D:\PortableMC\launch.bat"
if %errorlevel% neq 0 (
    echo Failed to delete files. Check permissions or if the path exists.
)
echo.
echo Deleting directories...
for /d %%x in ("D:\PortableMC\Launcher\*") do (
    rd /s /q "%%x"
)
if %errorlevel% neq 0 (
    echo Failed to delete directories. Check permissions or if the path exists.
)


echo Deletion completed.
IF NOT EXIST "D:\PortableMC\Setup\launcherpreset.zip" (
    echo Downloading assets...
curl -L -o "d:/PortableMC/Setup/launcherpreset.zip" "https://www.dropbox.com/scl/fi/lzpfi62vjae7ijt325ejh/launcherpreset.zip?rlkey=eglwserk6iu0yrvn7i9n1jyi5&st=z1toj08w&dl=1"

) 

echo Extracting...
powershell -command "Expand-Archive -Force 'D:\PortableMC\Setup\launcherpreset.zip' 'D:\PortableMC\Launcher\'"


rmdir /s /q d:\portablemc\setup\config
xcopy "D:\PortableMC\Setup\config" "D:\PortableMC\Launcher\Config"/E /I /Y
xcopy "D:\PortableMC\Setup\options.txt" "D:\PortableMC\Launcher\"/E /I /Y

echo Done!
echo Would you like to make a desktop shortcut for PortableMC?
choice /c yn /m "Pick an option"
if errorlevel 2 goto skip
if errorlevel 1 goto shortcut

:shortcut
call "D:\PortableMC\Setup\shortcut.bat"
goto end

pause
goto end


:offline
pause
goto end


