@echo off
setlocal enabledelayedexpansion
title kaomover by nuyai
echo kao is here to help move your ts4 mods (.package files) instead of you doing it yourself !!
echo.



:: made entierly by nuyai. please dont steal this, claim it as your own, repost it as if it's your own. tysm :3



:: initialize variables
set "do_log=0"
set "do_dry_run=0"

:: ask user for source folder
set /p customsource="enter source folder path for .package files or press enter to use downloads: "
if "%customsource%"=="" (
    set "source=%userprofile%\downloads"
) else (
    set "source=%customsource%"
)

:: remove any accidental quotes
set "source=%source:"=%"

:: ask user for destination folder
set /p packagedest="enter destination folder for .package files or press enter to use default mods folder: "
if "%packagedest%"=="" set "packagedest=%userprofile%\documents\electronic arts\the sims 4\mods"
set "packagedest=%packagedest:"=%"

:: make sure destination exists
if not exist "%packagedest%" mkdir "%packagedest%"

:: ask user if they want a log
set /p logchoice="do you want a log of what kao moves? (y/n): "
if /i "%logchoice%"=="y" (
    set "do_log=1"
    set "logfile=%packagedest%\kaomover-log.txt"
    echo made by nuyai - moved files log - %date% %time% > "%logfile%"
)

:: ----- dry run mode -----
if "%do_dry_run%"=="1" (
    echo dry run mode: here are the .package files that would be moved
    if exist "%source%\*.package" (
        pushd "%source%"
        for %%f in (*.package) do echo %%~nxf
        popd
    ) else echo no .package files found in "%source%"
    echo.
    echo press any key to exit dry run.
    pause
    exit /b
)

:: ----- move .package files -----
if exist "%source%\*.package" (
    pushd "%source%"
    for %%f in (*.package) do (
        echo moving "%%~nxf" to "%packagedest%"
        move "%%f" "%packagedest%" >nul
        if "%do_log%"=="1" echo moved %%~nxf >> "%logfile%"
    )
    popd
) else echo no .package files to move.

echo.
echo done !! kao moved all of your .package files.
if "%do_log%"=="1" (
    echo your log of moved files has been saved to "%logfile%"
    start "" "%logfile%"
)
pause
