@echo off
:: download latest version from GitHub

set "downloadUrl=https://raw.githubusercontent.com/nuyui/kao-mover/main/kaomover.bat"
set "tempFile=%temp%\kaomover.bat"

powershell -Command "(New-Object Net.WebClient).DownloadFile('%downloadUrl%', '%tempFile%')"

:: run the downloaded version
call "%tempFile%"