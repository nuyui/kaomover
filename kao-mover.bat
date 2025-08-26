@echo off
set "downloadUrl=https://raw.githubusercontent.com/nuyui/kaomover/main/kaomover/kaomover.bat"
set "tempFile=%TEMP%\kaomover.bat"

powershell -NoProfile -Command "Try { Invoke-WebRequest -Uri '%downloadUrl%' -OutFile '%tempFile%' -UseBasicParsing } Catch { Exit 1 }"

if not exist "%tempFile%" exit /b 1

call "%tempFile%"
