@echo off
setlocal ENABLEDELAYEDEXPANSION

set /a index=0
for /f "tokens=!index! delims=;" %%i in (%path%) do (
    index=!index!+1
    echo %%i)
endlocal