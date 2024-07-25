@echo off
setlocal

REM Define paths
set RFHUTIL_PATH="C:\Path\To\rfhutilc.exe"
set OUTPUT_DIR="%CD%\Output"

REM Debugging output
echo Running export_messages.bat
echo RFHUTIL_PATH: %RFHUTIL_PATH%
echo OUTPUT_DIR: %OUTPUT_DIR%
echo Current directory: %CD%

REM Check if RFHUTIL path exists
if not exist %RFHUTIL_PATH% (
    echo RFHUTIL.exe not found at %RFHUTIL_PATH%
    exit /b 1
)

REM Create output directory
if not exist %OUTPUT_DIR% (
    echo Creating directory %OUTPUT_DIR%
    mkdir %OUTPUT_DIR%
) else (
    echo Directory %OUTPUT_DIR% already exists
)

REM Example command to export messages
REM Replace with actual RFHUTIL command
echo Exporting messages...
%RFHUTIL_PATH% -someoptions > %OUTPUT_DIR%\messages.txt

endlocal
