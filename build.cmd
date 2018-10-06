@echo off
setlocal
cd %~dp0

ubuntu run ./%~n0.sh
exit /b %errorlevel%
