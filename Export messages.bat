@echo off
setlocal

REM RFHUTIL location
set RFHUTIL_PATH="C:\path\to\rfhutilc.exe"

REM Queue Manager and Queue names
set QMGR=YourQueueManager
set QUEUE=YourQueue

REM Get current date in YYYYMMDD format
for /f %%i in ('wmic os get localdatetime ^| find "."') do set datetime=%%i
set datestamp=%datetime:~0,8%

REM Output folder path
set OUTPUT_DIR=\\network\path\to\save\messages\%QUEUE%_%datestamp%

REM Create output directory
if not exist %OUTPUT_DIR% mkdir %OUTPUT_DIR%

REM Export messages one by one
set count=1
for /f "tokens=*" %%a in ('%RFHUTIL_PATH% -m %QMGR% -q %QUEUE% -g') do (
    echo %%a > %OUTPUT_DIR%\message_%count%.txt
    set /a count+=1
)

endlocal
