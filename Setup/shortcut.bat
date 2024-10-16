@echo off
setlocal

rem Define paths and variables
set "shortcutName=PortbaleMC"
set "targetPath=D:\PortableMC\portablemc.bat"   rem Change this to the path of your batch file
set "shortcutPath=%USERPROFILE%\Desktop\%shortcutName%.lnk"
set "iconPath=D:\Portablemc\setup\icon.ico"  rem Change this to the path of your custom icon



rem Create a VBScript to generate the shortcut
echo Set WshShell = WScript.CreateObject("WScript.Shell") > "%temp%\CreateShortcut.vbs"
echo Set shortcut = WshShell.CreateShortcut("%shortcutPath%") >> "%temp%\CreateShortcut.vbs"
echo shortcut.TargetPath = "%targetPath%" >> "%temp%\CreateShortcut.vbs"
echo shortcut.IconLocation = "%iconPath%" >> "%temp%\CreateShortcut.vbs"
echo shortcut.Save >> "%temp%\CreateShortcut.vbs"

rem Run the VBScript to create the shortcut
cscript /nologo "%temp%\CreateShortcut.vbs"

rem Clean up
del "%temp%\CreateShortcut.vbs"

echo Shortcut created on your desktop!










rem Define paths and variables
set "shortcutName=PortbaleMC"
set "targetPath=D:\PortableMC\portablemc.bat"   rem Change this to the path of your batch file
set "shortcutPath=%USERPROFILE%\oneDrive\Desktop\%shortcutName%.lnk"
set "iconPath=D:\Portablemc\setup\icon.ico"  rem Change this to the path of your custom icon



rem Create a VBScript to generate the shortcut
echo Set WshShell = WScript.CreateObject("WScript.Shell") > "%temp%\CreateShortcut.vbs"
echo Set shortcut = WshShell.CreateShortcut("%shortcutPath%") >> "%temp%\CreateShortcut.vbs"
echo shortcut.TargetPath = "%targetPath%" >> "%temp%\CreateShortcut.vbs"
echo shortcut.IconLocation = "%iconPath%" >> "%temp%\CreateShortcut.vbs"
echo shortcut.Save >> "%temp%\CreateShortcut.vbs"

rem Run the VBScript to create the shortcut
cscript /nologo "%temp%\CreateShortcut.vbs"

rem Clean up
del "%temp%\CreateShortcut.vbs"

echo Shortcut created on your onedrive desktop!
pause




pause
