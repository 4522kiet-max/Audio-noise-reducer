@echo off
setlocal enabledelayedexpansion
title Audio Noise Reducer - Python Backend Server (FastAPI + SciPy SVD)

echo =====================================================================
echo    AUDIO NOISE REDUCER - SCIENTIFIC BACKEND SERVER (FASTAPI + SCIPY)
echo =====================================================================
echo.

set "PYTHON_CMD="

if exist "%LOCALAPPDATA%\Programs\Python\Python314\python.exe" (
    set "PYTHON_CMD="%LOCALAPPDATA%\Programs\Python\Python314\python.exe""
) else (
    where py >nul 2>nul
    if !errorlevel! equ 0 (
        set "PYTHON_CMD=py -3.14"
    ) else (
        where python >nul 2>nul
        if !errorlevel! equ 0 set "PYTHON_CMD=python"
    )
)

if "%PYTHON_CMD%"=="" (
    echo [ERROR] Python was not found in PATH or standard installation directory.
    echo Please install Python 3.10+ from python.org or the Microsoft Store.
    pause
    exit /b 1
)

echo Using Python: %PYTHON_CMD%
cd /d "%~dp0"
echo Starting server on http://127.0.0.1:8000 ...
echo Press Ctrl+C to terminate.
echo.

%PYTHON_CMD% server.py
pause
