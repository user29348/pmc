@echo off
setlocal enabledelayedexpansion

rem Set your target mods folder and disabled mods folder
set "modsDir=D:\portablemc\launcher\mods"
set "disabledModsDir=D:\portablemc\launcher\xmods"

rem Create the disabled mods directory if it doesn't exist
if not exist "%disabledModsDir%" (
    mkdir "%disabledModsDir%"
)

:main
cls
echo.
echo ---------------------------------------
echo Mod Management Tool
echo ---------------------------------------

echo.

rem List all .jar mods in the target directory
set count=0
for %%i in ("%modsDir%\*.jar") do (
    set /a count+=1
    set "mod!count!=%%~nxi"
    
    rem Get the size of the file
    set "modSize=%%~zi"
    
    echo !count!. %%~nxi - Size: !modSize! bytes
)
if %count%==0 (
    echo No mod files found in %modsDir% or %disabledModsDir%.
    pause
    goto end
)
echo.
echo Disabled Mods ---------------------------
echo.
rem List all disabled mods starting from a new index
set disabledCount=!count!
set disabledStartNum=0
for %%i in ("%disabledModsDir%\*.jar") do (
    set /a disabledCount+=1
    set "disabledMod!disabledCount!=%%~nxi"
    
    rem Get the size of the file
    set "disabledModSize=%%~zi"
    
    set /a currentDisabledIndex=!disabledStartNum! + !disabledCount!
    echo !currentDisabledIndex!. Disabled: %%~nxi - Size: !disabledModSize! bytes
)

if %disabledCount%==0 (
    echo No mod files found in %modsDir% or %disabledModsDir%.
    pause
    goto end
)

echo =======================================
echo Options:
echo x - Delete a mod
echo e - Enable a mod
echo d - Disable a mod
echo b - Back
echo =======================================
set /p action="Enter your selection (x/e/d/b): "

if /i "%action%"=="x" goto deletemod
if /i "%action%"=="e" goto enablemod
if /i "%action%"=="d" goto disablemod
if /i "%action%"=="b" goto end

echo Invalid selection. Please try again.
pause
goto main

:deletemod
set /p modnum="Enter the mod number to delete: "
if "!mod%modnum%!"=="" (
    echo Invalid selection. Please try again.
    pause
    goto main
)

echo You selected to delete the mod: !mod%modnum%!
set /p confirm="Are you sure? This action cannot be undone (y/n): "
if /i "!confirm!"=="y" (
    del "%modsDir%\!mod%modnum%!"
    echo Mod deleted.
) else (
    echo Deletion canceled.
)

pause
goto main

:enablemod
set /p modnum="Enter the mod number to enable: "
if !disabledMod%modnum%!=="" (
    echo Invalid selection. Please try again.
    pause
    goto mainmenu
)

echo You selected to enable the mod: !disabledMod%modnum%!
move "%disabledModsDir%\!disabledMod%modnum%!" "%modsDir%\" >nul 2>&1
if errorlevel 1 (
    echo Failed to enable the mod. It may not exist.
) else (
    echo Mod enabled: !disabledMod%modnum%!
)
pause
goto main


:disablemod
set /p modnum="Enter the mod number to disable: "
if "!mod%modnum%!"=="" (
    echo Invalid selection. Please try again.
    pause
    goto main
)

echo You selected to disable the mod: !mod%modnum%!
move "%modsDir%\!mod%modnum%!" "%disabledModsDir%\" >nul 2>&1
if errorlevel 1 (
    echo Failed to disable mod. Please check if the file exists.
) else (
    echo Mod disabled: !mod%modnum%!
)

pause
goto main

:end
echo Exiting Mod Management Tool...
pause
endlocal
exit /b
