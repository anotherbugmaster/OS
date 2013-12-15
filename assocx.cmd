@echo off
setlocal ENABLEDELAYEDEXPANSION

set temp=0

for /F "tokens=3 usebackq" %%s in (`reg QUERY HKLM\SOFTWARE\Classes\%1 /ve ^2^>nul ^| findstr "REG_SZ"`) do set temp=%%s & echo !temp!

if !temp!==0 (echo File is not exist & goto :eof)

for /F "usebackq tokens=6 delims=\" %%s in (`reg QUERY HKLM\SOFTWARE\Classes\!temp!\shell /s ^| findstr "command"`) do (
	for /F "tokens=4,* usebackq" %%x in (`reg QUERY HKLM\SOFTWARE\Classes\!temp!\shell\%%s\command /ve`) do (
		echo %%s %%x%%y))
endlocal 