# Editors
choco install visualstudiocode
choco install atom --pre

# Languages
choco install python3 --params '"/InstallDir:C:\Tools\python3"'
#choco install ruby

# Other
choco install gitkraken
choco install git.install --params="'/GitAndUnixToolsOnPath'"
#choco install heroku-cli
choco install nodejs.install

# Installs for atom and python
code --install-extension Shan.code-settings-sync
apm install sync-settings
apm install atom-beautify
pip install --upgrade autopep8
