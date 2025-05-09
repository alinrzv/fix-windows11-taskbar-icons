@echo off
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f
echo Taskband key deleted.
pause
