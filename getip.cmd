@echo off
chcp 65001 
setlocal ENABLEDELAYEDEXPANSION

if "%1"=="/?" echo Usage: getip & goto :eof
FOR /F "tokens=2 usebackq delims=:" %%S IN (`ipconfig ^| findstr "IP.*[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" `) DO (
	set ip=%%S
    echo !ip:~1!
    ) 
endlocal 