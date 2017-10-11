<#
.SYNOPSIS
Re-image Post-Install Script

.DESCRIPTION
After re-installing Windows,  this will Set up various settings, install chocolatey, install packages, and install custom packages that Chocolatey cannot/does not support yet.

.EXAMPLE
.\Install-Workstation.ps1

.INPUTS
None

.OUTPUTS
None

.LINK

https://github.com/JourneyOver/
#>

# Make sure PowerShell help is useful
Update-Help -Confirm:$false;

# Set Power Profile to High Performance
.\Set-PowerProfile.ps1

# Delete some default apps (collecting data so this won't be fully ready for some time)
.\Remove-Default-Apps.ps1

# Setup local user profile and add features
. .\NeverNotify-UAC.ps1
Set-UACLevel 0
. .\Restart-Explorer.ps1
. .\Move-UserShellFolders.ps1
Move-LibraryDirectory 'My Video' 'D:\Videos'
.\Install-GodMode.ps1
. .\Set-WindowsExplorerOptions.ps1
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions -EnableShowFullPathInTitleBar -DisableOpenFileExplorerToQuickAccess -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess
. .\Set-TaskbarOptions.ps1
Set-TaskbarOptions -Size Small -Lock -Combine Always

# Pin github and testing folder to Quick Access
.\Set-QuickAccess.ps1 -Action Pin -Path "$env:USERNAME\Desktop\Github"
.\Set-QuickAccess.ps1 -Action Pin -Path "$env:USERNAME\Desktop\TESTING"

# Install chocolatey and packages
.\choco\Install-Chocolatey.ps1

# Install/Update packages from PatchMyPC
.\PatchMyPC\PatchMyPC.ps1

# Add Devcon to run at startup
.\Devcon\StartDevcon.ps1

### WIP ###
