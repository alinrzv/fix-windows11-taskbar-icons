@echo off
echo Deleting Taskband registry key...
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f
echo Taskband key deleted.

echo Deleting taskbar cached icons...
:: Close Explorer first to release the cache files
taskkill /f /im explorer.exe

:: Delete IconCache files (taskbar icons are cached here)
del /f /q "%localappdata%\Microsoft\Windows\Explorer\iconcache*"

:: Restart Explorer
start explorer.exe

echo Done.
pause
