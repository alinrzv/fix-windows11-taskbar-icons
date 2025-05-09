# PowerShell script to delete the Taskband registry key
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband"

if (Test-Path $regPath) {
    Remove-Item -Path $regPath -Recurse -Force
    Write-Host "Taskband key deleted successfully."
} else {
    Write-Host "Taskband key does not exist."
}
