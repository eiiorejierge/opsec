@echo off
REM ============================================================
REM  open-chrome.bat
REM  Opens a local file in Google Chrome.
REM
REM  Usage:
REM    open-chrome.bat                  -> opens the default file below
REM    open-chrome.bat "C:\path\x.html" -> opens the file you pass in
REM ============================================================

REM --- Edit this to point at your local file -------------------
set "TARGET=%~1"
if "%TARGET%"=="" set "TARGET=%~dp0index.html"
REM -------------------------------------------------------------

REM Try the common Chrome install locations, in order.
set "CHROME="
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set "CHROME=%LocalAppData%\Google\Chrome\Application\chrome.exe"

if "%CHROME%"=="" (
    echo Could not find chrome.exe in the usual locations.
    echo Edit this file and set CHROME to the full path of chrome.exe.
    pause
    exit /b 1
)

REM Launch Chrome with the file as a proper file:// URL.
start "" "%CHROME%" "file:///%TARGET:\=/%"
