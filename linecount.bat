@echo off
setlocal

REM Example Usage:
REM linecount.bat "/Path/To/Project" .py .js .txt

set "root=%~1"
shift
if "%~1"=="" (
    echo Usage: %~nx0 "C:\Path\To\Dir" .ext1 .ext2 ...
    exit /b 1
)

set /a totalLines=0
set /a totalFiles=0

echo [+] Counting files in "%~0"

:next_ext
if "%~1"=="" goto :done

echo.

set "ext=%~1"

for /R "%root%" %%F in (*%ext%) do (
    for /f %%L in ('type "%%F" ^| find /v /c ""') do (
        echo %%F - Lines: %%L
        set /a totalLines+=%%L
        set /a totalFiles+=1
    )
)

shift
goto :next_ext

:done
echo.
echo [!] Total files counted: %totalFiles%
echo [!] Total lines across all specified file types: %totalLines%

endlocal
