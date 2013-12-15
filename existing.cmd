setlocal ENABLEDELAYEDEXPANSION
FOR /F %%f IN (%1) DO IF EXIST %2\%%f ECHO %%f exists in %2
endlocal