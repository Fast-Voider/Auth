@echo off
setlocal enabledelayedexpansion

:: Function to generate a random character (A-Z, 0-9)
:randChar
set /a "num=%random% %% 36"
if %num% lss 10 (
    set /a "num+=48"
) else (
    set /a "num+=55"
)
for /f %%a in ('cmd /c echo\^!num^!') do set "char=%%a"
exit /b

:: Ask for the number of keys
set /p "keyCount=How many keys do you want to generate? "

:: Generate the keys
for /l %%i in (1, 1, %keyCount%) do (
    set "key="
    for /l %%j in (1, 1, 24) do (
        call :randChar
        set "key=!key!!char!"
        if %%j==8 set "key=!key!-"
        if %%j==16 set "key=!key!-"
    )
    echo !key!
)

endlocal
pause
