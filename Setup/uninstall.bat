@echo off
cls
color 04
echo.
echo ---------------------------
echo Uninstall PortableMC
echo ---------------------------
echo.
echo. 
echo HOLD ON! ARE YOU ABSOLUTELY
echo SURE YOU WANT TO UNINSTALL 
ECHO PORTABLEMC? THIS WILL
ECHO DELETE EVERYTHING EXCEPT 
ECHO BACKUPS AND YOU WILL NEED
ECHO TO DOWNLOAD IT AGAIN TO PLAY
echo.
echo.
choice /c yn /m "Do you want to delete?"
if errorlevel 2 goto offline
if errorlevel 1 goto yes

:yes
echo Deleting... this will take a long time!
start /b "" cmd /c del "D:\PortableMC"&exit
goto end

:offline


goto end