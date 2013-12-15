@ECHO off
ECHO %PATH%
ECHO.
CALL :testargs "these are days" "when the brave endure"
GOTO :pauseit
:testargs
SET ARGS=%~1;%~2;%1;%2
ECHO %ARGS%
ECHO.
exit /B 0
:pauseit
pause