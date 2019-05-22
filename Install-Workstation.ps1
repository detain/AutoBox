<#
.SYNOPSIS
Re-image Post-Install Script

.DESCRIPTION
After re-installing Windows, this will Set up various settings, install chocolatey, install packages, and install custom packages that Chocolatey cannot/does not support yet.

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

# Turn UAC to never notify
Write-Host "Trying to turn UAC to: Never Notify"
. .\NeverNotify-UAC.ps1
Set-UACLevel 0

# Set Power Profile to High Performance
Write-Host "Trying to set Power Profile to: High Performance"
.\Set-PowerProfile.ps1

# Delete some default apps
Write-Host "Trying to remove: Default Installed Apps"
.\Remove-Default-Apps.ps1

# Setup local user profile and add features
. .\Restart-Explorer.ps1
. .\Move-UserShellFolders.ps1
Write-Host "Moving My Video to D:\Media"
Move-LibraryDirectory 'My Video' 'D:\Media'
Write-Host "Trying to install: Windows Features"
.\Install-WindowsFeature.ps1 NetFx3
.\Install-WindowsFeature.ps1 SmbDirect
.\Install-WindowsFeature.ps1 SMB1Protocol
.\Install-WindowsFeature.ps1 SMB1Protocol-Client
.\Install-WindowsFeature.ps1 SMB1Protocol-Server
. .\Set-WindowsExplorerOptions.ps1
Write-Host "Trying to set: Windows Explorer Options"
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions -EnableShowFullPathInTitleBar -DisableOpenFileExplorerToQuickAccess -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess
. .\Set-TaskbarOptions.ps1
Write-Host "Trying to set: Taskbar Options"
Set-TaskbarOptions -Size Small -Lock -Combine Always

# Pin folders to Quick Access
Write-Host "Pinning folders to Quick Access"
.\Set-QuickAccess.ps1 -Action Pin -Path "$env:UserProfile\Desktop\Github"
.\Set-QuickAccess.ps1 -Action Pin -Path "C:\Tools\nginx"
#.\Set-QuickAccess.ps1 -Action Pin -Path "$env:UserProfile\.config\bw_plex"
.\Set-QuickAccess.ps1 -Action Pin -Path "E:\Emulation"
.\Set-QuickAccess.ps1 -Action Pin -Path "E:\3DS Tools"

# Install chocolatey and packages
Write-Host "Trying to install: Chocolatey and Packages"
.\Install-Chocolatey.ps1

# Install/Update packages from PatchMyPC
Write-Host "Trying to install: tools from PatchMyPC"
.\PatchMyPC\PatchMyPC.ps1

# Add Devcon to run at startup (disabled for now)
#Write-Host "Adding Devcon to run at startup"
#.\Devcon\StartDevcon.ps1

# Copy formatting tools to user profile
Write-Host "Trying to copy: Formatting tools to User Profile"
.\Copy-FormattingTools.ps1

# Installs PIP packages
Write-Host "Trying to install: PIP Packages"
python -m pip install -U pip setuptools
pip install pipenv
pip install python-language-server
pip install --upgrade autopep8
#pip install bw_plex[all]

# Installs PowerShell Modules
Write-Host "Trying to install: PowerShell Modules"
Install-Module -Name PSScriptAnalyzer
Install-Module -Name PowerShell-Beautifier
Install-Module -Name Pester -Force

# Installs NPM packages
Write-Host "Trying to install: NPM Packages"
npm -g install csso-cli # https://github.com/css/csso-cli
npm -g install gulp-cli # https://github.com/gulpjs/gulp-cli
npm -g install ytdl # https://github.com/fent/node-ytdl
npm -g install speed-test # https://github.com/sindresorhus/speed-test
npm -g install fkill-cli # https://github.com/sindresorhus/fkill-cli
