$OS = (Get-WmiObject -class Win32_OperatingSystem).Caption

If ($OS -match "Microsoft Windows 10") {
  # Install chocolatey
  Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
} Else {
  # Install Chocolatey for Powershell v2
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Refresh the PSEnviroment
refreshenv

# Stop getting prompted
choco feature enable -n=allowGlobalConfirmation

# Remember Arguments when upgrading programs
choco feature enable -n=useRememberedArgumentsForUpgrades

# Chocolatey GUI
choco install chocolateygui --source https://www.myget.org/F/chocolateygui/ --pre

# Install all other apps
choco install 7zip.install
choco install atom --pre
choco install autohotkey.install
choco install bulkrenameutility.install
choco install centbrowser
choco install cheatengine
choco install cue
choco install dropbox --pre
choco install geforce-experience
choco install git.install --params="'/GitAndUnixToolsOnPath'"
choco install gitkraken
choco install goggalaxy
choco install itch
choco install jackett
choco install jbs
choco install lockhunter
choco install memreduct
choco install mremoteng
choco install msiafterburner
choco install nodejs.install
choco install plexmediaserver
choco install python3 --params '"/InstallDir:C:\Tools\python3"'
choco install qbittorrent --x86
choco install sonarr
choco install steam
choco install streamlink
choco install teamviewer
choco install twitch
choco install unchecky
choco install ussf
choco install vlc
choco install vnc-viewer
choco install windirstat
choco install winrar

# Install cint-gh packages
[System.Net.ServicePointManager]::SecurityProtocol = 3072 -bor
  768 -bor
  [System.Net.SecurityProtocolType]::Tls -bor
  [System.Net.SecurityProtocolType]::Ssl3

iwr https://goo.gl/aFBC52 | iex; cinst-gh leonflix --force
