@echo off
setlocal enabledelayedexpansion

rem Set your target folder (modify this or prompt the user for a path)
set "targetDir=D:\PortableMC\Launcher\saves"

:mainmenu
cls
echo.
echo -------------------------------------
echo World Management Tool
echo -------------------------------------

echo.

rem List all folders in the target directory along with their sizes
set count=0
for /d %%i in ("%targetDir%\*") do (
    set /a count+=1
    set "folder!count!=%%~nxi"
    
    rem Calculate the size of the folder
    set "folderSize=0"
    for /f "usebackq" %%j in (`dir /s /a "%%i" ^| find "File(s)"`) do (
        for /f "tokens=3" %%k in ("%%j") do (
            set /a folderSize+=%%k
        )
    )
    
    echo !count!. %%~nxi
)

if %count%==0 (
    echo No folders found in %targetDir%.
    pause
    goto end
)

echo =======================================
echo Options:
echo d - Delete a folder
echo b - Backup a folder
echo x - Exit
echo =======================================
set /p action="Enter your selection (d/b/x): "

if /i "%action%"=="d" goto deletefolder
if /i "%action%"=="b" goto backupfolder
if /i "%action%"=="x" goto end

goto mainmenu

:deletefolder
set /p foldernum="Enter the folder number to delete: "
if !folder%foldernum%!=="" (
    echo Invalid selection. Please try again.
    pause
    goto mainmenu
)

echo You selected to delete the folder: !folder%foldernum%!
set /p confirm="Are you sure? This action cannot be undone (y/n): "
if /i "%confirm%"=="y" (
    rmdir /s /q "%targetDir%\!folder%foldernum%!"
    echo Folder deleted.
) else (
    echo Deletion canceled.
)

pause
goto mainmenu

:backupfolder
set /p foldernum="Enter the folder number to backup: "
if !folder%foldernum%!=="" (
    echo Invalid selection. Please try again.
    pause
    goto mainmenu
)

echo You selected to backup the folder: !folder%foldernum%!
set backupdir=D:\PortableMC Backups
if not exist "%backupdir%" (
    mkdir "%backupdir%"
)

xcopy /e /i "%targetDir%\!folder%foldernum%!" "%backupdir%\!folder%foldernum%!_backup_%date%"
echo Folder backed up to: %backupdir%\!folder%foldernum%!_backup_%date%

pause
goto mainmenu

:end
echo Exiting World Management Tool...
pause
endlocal
exit /b
