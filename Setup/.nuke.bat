@echo off
color 0F
cls
echo.
echo --------------------------
echo        Delete               
echo --------------------------
echo.
echo did you mess something up?
echo.
echo Are you sure you want to
echo uninstall this instance
echo This will remove all world
echo saves and mods and configs
echo.
choice /c yn /m "Do you want to delete?"

if errorlevel 2 goto no
if errorlevel 1 goto yes

:yes
echo Deleting Mods and Figs
del /q "D:\PortableMC\Launcher\*.*"
echo Deleting launcher file
del  "D:\PortableMC\launch.bat"
echo Deleting Install/Reinstall file
del  "D:\PortableMC\reinstall.bat"
del  "D:\PortableMC\install.bat"





echo.
echo Deleting subdirectories - This will take longer depending on how big the installation is
echo [
for /d %%x in ("D:\PortableMC\Launcher\*") do (
    rd /s /q "%%x"

)












echo Deletion completed.
pause
goto end

:no
echo Aborted deletion.
pause
:end