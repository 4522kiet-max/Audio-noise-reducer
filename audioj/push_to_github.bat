@echo off
setlocal enabledelayedexpansion
title Push Audio Noise Reducer to GitHub (4522kiet-max/Audio-noise-reducer)

echo =====================================================================
echo       AUDIO NOISE REDUCER - GITHUB REPOSITORY PUSH SCRIPT
echo       Repository: https://github.com/4522kiet-max/Audio-noise-reducer.git
echo =====================================================================
echo.

set "PATH=C:\Users\DELL\AppData\Local\Programs\MinGit\cmd;%PATH%"

cd /d "%~dp0"

echo [1/3] Checking Git Status and Local Commit...
git status
echo.

echo [2/3] Verifying Remote Origin URL...
git remote -v
echo.

echo [3/3] Pushing to GitHub (branch: main)...
echo If a GitHub login window appears, authorize in your browser.
echo.
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo =====================================================================
    echo [SUCCESS] Code pushed successfully to GitHub!
    echo Repository: https://github.com/4522kiet-max/Audio-noise-reducer
    echo =====================================================================
) else (
    echo.
    echo =====================================================================
    echo [AUTH REQUIRED] GitHub requires authentication to push.
    echo.
    echo Option 1: Complete the one-time browser login prompt above.
    echo Option 2: Use a GitHub Personal Access Token (PAT):
    echo           1. Go to https://github.com/settings/tokens
    echo           2. Generate token with 'repo' scope
    echo           3. Use your GitHub username and the token as password.
    echo =====================================================================
)

echo.
pause
