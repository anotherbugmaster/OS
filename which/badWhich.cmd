@echo off
setlocal ENABLEDELAYEDEXPANSION

if "%1" == "/?" (
    echo Shows path of given executable
    goto END
    )
    
set teststring=%cd%%path%
set extensions=%pathext%
set ext=.exe

:stringLOOP
    if "!teststring!" EQU "" goto END
    for /f "delims=;" %%a in ("!teststring!") do set substring=%%a
        set filename=!substring!\%1

        if exist !filename!!ext! (
            echo !substring!\%1!ext!
            goto END
        ) else (
            if "!filename:~-4,4!" == "!ext!" (
                if exist !filename! (echo !filename!
                    goto END))
        )
:striploop
    set stripchar=!teststring:~0,1!
    set teststring=!teststring:~1!
    if "!teststring!" EQU "" goto stringloop
    if "!stripchar!" NEQ ";" goto striploop
    goto stringloop
:END
endlocal