@echo off
setlocal EnableExtensions
title Install Let AI Be AI

set "SKILL_NAME=let-ai-be-ai"
set "SOURCE_DIR=%~dp0"

if defined CODEX_HOME (
  set "TARGET_ROOT=%CODEX_HOME%\skills"
) else (
  if "%USERPROFILE%"=="" goto no_profile
  set "TARGET_ROOT=%USERPROFILE%\.codex\skills"
)

set "TARGET_DIR=%TARGET_ROOT%\%SKILL_NAME%"

echo.
echo Let AI Be AI - Windows installer
echo Target: "%TARGET_DIR%"
echo.

if not exist "%SOURCE_DIR%SKILL.md" goto bad_source
if not exist "%SOURCE_DIR%agents\openai.yaml" goto bad_source

where robocopy >nul 2>&1
if errorlevel 1 goto no_robocopy

if exist "%TARGET_DIR%\" (
  echo An existing installation was found.
  choice /C YN /N /M "Update it without deleting extra files? [Y/N] "
  if errorlevel 2 goto cancelled
)

if not exist "%TARGET_ROOT%\" (
  mkdir "%TARGET_ROOT%"
  if errorlevel 1 goto create_failed
)

robocopy "%SOURCE_DIR%" "%TARGET_DIR%" /E /R:1 /W:1 /XD ".git" "__MACOSX" /XF ".DS_Store" >nul
set "COPY_EXIT=%ERRORLEVEL%"
if %COPY_EXIT% GEQ 8 goto copy_failed

if not exist "%TARGET_DIR%\SKILL.md" goto verify_failed
if not exist "%TARGET_DIR%\agents\openai.yaml" goto verify_failed

echo.
echo Installation complete.
echo Installed to: "%TARGET_DIR%"
echo Restart Codex or ChatGPT desktop if Let AI Be AI does not appear in Skills.
echo.
pause
exit /b 0

:cancelled
echo.
echo Installation cancelled. No files were copied.
pause
exit /b 0

:no_profile
echo ERROR: USERPROFILE is not available and CODEX_HOME is not set.
goto failed

:bad_source
echo ERROR: Required skill files were not found next to install.cmd.
echo Extract the complete let-ai-be-ai folder before running install.cmd.
goto failed

:no_robocopy
echo ERROR: robocopy is not available on this Windows system.
goto failed

:create_failed
echo ERROR: Could not create "%TARGET_ROOT%".
goto failed

:copy_failed
echo ERROR: File copy failed. Robocopy exit code: %COPY_EXIT%
goto failed

:verify_failed
echo ERROR: Installation verification failed because required files are missing.

:failed
echo.
echo Installation did not complete.
pause
exit /b 1
