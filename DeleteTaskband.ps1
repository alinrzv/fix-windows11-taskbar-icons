# PowerShell script to delete the Taskband registry key and clear taskbar cached icons

$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband"

# Delete Taskband registry key
if (Test-Path $regPath) {
    Remove-Item -Path $regPath -Recurse -Force
    Write-Host "Taskband key deleted successfully."
} else {
    Write-Host "Taskband key does not exist."
}

# Stop Explorer to release icon cache files
Write-Host "Stopping Explorer..."
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue

# Delete icon cache files used by Explorer
$iconCachePath = "$env:LOCALAPPDATA\Microsoft\Windows\Explorer"
Get-ChildItem -Path $iconCachePath -Filter "iconcache*" -File | Remove-Item -Force -ErrorAction SilentlyContinue

Write-Host "Icon cache files deleted."

# Restart Explorer
Write-Host "Restarting Explorer..."
Start-Process explorer.exe

Write-Host "Done."
