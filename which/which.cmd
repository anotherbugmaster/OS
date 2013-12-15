@echo off
setlocal ENABLEDELAYEDEXPANSION

if "%1" == "/?" (
    echo Shows path of given executable
    goto :eof
    )

set path=%~dp0;%path%

:changeExt

call :findPattern %1
for %%d in (%pathext%) do (
	call :findPattern %1%%d
	)
if "!isFound!" == "" echo No such file
goto :eof

:findPattern

set string=%~$path:1

if not "!string!" == "" (
	echo !string!
	set isFound=true
	)
goto :eof

endlocal