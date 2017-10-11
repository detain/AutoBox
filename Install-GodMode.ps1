<#
.SYNOPSIS
Installs a Windows 10 "GodMode" folder in the Public profile.

.DESCRIPTION
Creates a new folders and names it to transform it into the "GodMode" control panel.
The shortcut is placed in the Public profile on the desktop of the machine so all users have access to it.

.PARAMETER None

.EXAMPLE
.\Install-GodMode.ps1

.INPUTS

.OUTPUTS

.LINK

https://github.com/JourneyOver/
#>

if (!(Test-Path -Path "$ENV:PUBLIC\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}")) {
  Write-Output "Installing GodMode shortcut to Public User profile..."
  New-Item -Path "$ENV:PUBLIC\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" -ItemType "Directory" | Out-Null
  Write-Output "GodMode installed complete!"
}
else {
  Write-Output "GodMode has already been installed on this computer. Exiting..."
}
