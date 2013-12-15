@echo off

setlocal
if "%1"=="/?" echo Usage: tempfile [path] & goto :eof
if "%1"=="" (set temppath=%cd%) else (set temppath=%1)
cd %temppath%

:start

set rand=%random%.tmp
if EXIST %rand% (goto :start) else (echo. >%rand%)
echo %rand% in %temppath%
cd %temppath%
endlocal