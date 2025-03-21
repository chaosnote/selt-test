@echo off

set work_dir=%~dp0
set curr_dir=%cd%

cd /d %work_dir%

cd /d %work_dir%

@REM 運行 1 次
"%work_dir%dist/monkey_1060.exe" --step 0 --debug

cd /d %curr_dir%

pause