$OS = (Get-WmiObject -class Win32_OperatingSystem).Caption

If ($OS -match "Microsoft Windows 10") {
  # Install chocolatey
  Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
} Else {
  # Install Chocolatey for Powershell v2
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Refresh the PSEnviroment
Update-SessionEnvironment

# Stop getting prompted
choco feature enable -n=allowGlobalConfirmation

# Remember Arguments when upgrading programs
choco feature enable -n=useRememberedArgumentsForUpgrades

# Chocolatey GUI
choco install chocolateygui --source https://www.myget.org/F/chocolateygui/ --pre

# Install all other apps
choco install 7zip
choco install altdrag
choco install atom
choco install autohotkey
choco install bulkrenameutility
choco install centbrowser --pre
choco install cheatengine --ignore-checksum
#choco install cue
choco install dropbox
choco install etcher
choco install ffmpeg
choco install filezilla
choco install flashplayerplugin
choco install geforce-experience
choco install geforce-game-ready-driver
choco install git --params="'/GitAndUnixToolsOnPath'"
choco install gitkraken
choco install goggalaxy
#choco install heroku-cli
choco install itch
choco install jackett
choco install jbs
choco install jq
choco install lockhunter
choco install memreduct
choco install mkvtoolnix
choco install mremoteng
choco install msiafterburner
choco install nodejs
choco install origin
#choco install plexmediaserver
choco install python3 --version 3.7.2 --params '"/InstallDir:C:\Tools\python3"'
#choco install anaconda3 --params '"/AddToPath /D:C:\Tools"'
choco install qbittorrent --x86
#choco install ruby --params '"/InstallDir:C:\Tools\ruby"'
choco install sonarr --pre
choco install ssip.portable
choco install steam
choco install streamlink
choco install teamviewer
choco install twitch --ignore-checksum
choco install unchecky
choco install uplay
choco install ussf
choco install vlc
choco install vnc-viewer
choco install wget
choco install whocrashed --ignore-checksum
choco install winrar
choco install winscp
choco install wiztree
choco install yarn

# Install cint-gh packages
#[System.Net.ServicePointManager]::SecurityProtocol = 3072 -bor
#  768 -bor
#  [System.Net.SecurityProtocolType]::Tls -bor
#  [System.Net.SecurityProtocolType]::Ssl3
#
#Invoke-WebRequest https://goo.gl/aFBC52 -UseBasicParsing | Invoke-Expression; cinst-gh leonflix --force
#iwr https://goo.gl/aFBC52 -UseBasicParsing | iex; cinst-gh swig --force
