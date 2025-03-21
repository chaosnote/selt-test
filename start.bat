@echo off
setlocal enabledelayedexpansion

set work_dir=%~dp0
set curr_dir=%cd%

cd /d %work_dir%

set "inputFile=docker-compose-doc.yaml"
set "outputFile=docker-compose.yaml"
set "searchText={{Dist}}"
set "replaceText=%work_dir%dist"

if not exist "%inputFile%" (
    echo lost "%inputFile%"
    pause
    exit /b 1
)

(for /f "delims=" %%a in ('type "%inputFile%"') do (
    set "line=%%a"
    set "line=!line:%searchText%=%replaceText%!"
    echo !line!
)) > "%outputFile%"

docker-compose up -d

cd /d %curr_dir%

pause