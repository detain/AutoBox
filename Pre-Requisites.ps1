#Requires -RunAsAdministrator
Clear-Host

Write-Host ""
Write-Host "------------------------------------------" -ForegroundColor Cyan
Write-Host "         Pre-Requisites - Started!" -ForegroundColor Cyan
Write-Host "------------------------------------------" -ForegroundColor Cyan

Write-Host ""
Write-Host "Trying to set ExecutionPolicy to 'Unrestricted'"
Set-ExecutionPolicy Unrestricted

Write-Host "Trying to install: PowerShellGet"
Install-Module -Name PowerShellGet -Force

Write-Host "Trying to install: SSV-Core"
Install-Module -Name "SSV-Core" -Force

Write-Host "Trying to install: PowerShellCookBook"
Install-Module -Name "PowerShellCookBook" -Force

Write-Host "Trying to install: PSScriptAnalyzer"
Install-PackageProvider Nuget -force -verbose
Install-Module -Name "PSScriptAnalyzer" -Force

Write-Host ""
Write-Host "------------------------------------------" -ForegroundColor Cyan
Write-Host "         Pre-Requisites - Complete!" -ForegroundColor Cyan
Write-Host "------------------------------------------" -ForegroundColor Cyan
