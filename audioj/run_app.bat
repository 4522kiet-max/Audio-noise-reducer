@echo off
setlocal enabledelayedexpansion

echo =====================================================================
echo         AUDIO NOISE REDUCER - SVD RANK REDUCTION ENGINE (E4)
echo              ABHIYAN Mini Project Programme Demonstration
echo =====================================================================
echo.

:: 1. Detect Python Executable (Prioritizing Python 3.14 with GIL for NumPy)
set "PYTHON_CMD="

if exist "%LOCALAPPDATA%\Programs\Python\Python314\python.exe" (
    set "PYTHON_CMD="%LOCALAPPDATA%\Programs\Python\Python314\python.exe""
) else (
    where py >nul 2>nul
    if !errorlevel! equ 0 (
        set "PYTHON_CMD=py -3.14"
    ) else (
        where python >nul 2>nul
        if !errorlevel! equ 0 (
            set "PYTHON_CMD=python"
        )
    )
)

if "%PYTHON_CMD%"=="" (
    echo [WARNING] Python 3.x was not automatically detected.
    echo Launching the application in Standalone Browser Engine mode...
    echo.
    start "" "%~dp0frontend\index.html"
    echo Frontend opened in browser.
    pause
    exit /b 0
)

echo [OK] Python Engine Located: %PYTHON_CMD%
echo [1/2] Starting Python FastAPI + SciPy Backend Server (Port 8000)...

:: Launch backend in a separate terminal window titled with logs
start "Audio Noise Reducer - Python Backend Server" /min cmd /k "cd /d "%~dp0backend" && %PYTHON_CMD% server.py"

echo Waiting 2 seconds for backend server initialization...
timeout /t 2 /nobreak >nul

echo [2/2] Launching Audio Noise Reducer Web Application...
start http://127.0.0.1:8000/

echo.
echo =====================================================================
echo  STATUS: Full-Stack Application is Active and Running!
echo.
echo  * Backend REST API:  http://127.0.0.1:8000/api/health
echo  * Web Application:   http://127.0.0.1:8000/
echo  * Direct HTML file:  %~dp0frontend\index.html
echo.
echo  To shut down, close the minimized Backend Server window.
echo =====================================================================
echo.
pause
