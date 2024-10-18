@echo off
echo ----------------------------
echo PortableMC Update Enviroment
echo ----------------------------
echo.
echo How it works:
echo - Update ( <5MB Downlaod )
echo   is downloaded onto the USB
echo   drive and extracted
echo - Update executable will run
echo   and install the update
echo - PortableMC will remove the
echo   leftover update files
echo   that are no longer needed
echo
curl -o "d:/temp.zip" "https://codeload.github.com/user29348/pmc/zip/refs/heads/update" 
powershell -command "Expand-Archive -Force 'D:\temp.zip' 'D:\'"

