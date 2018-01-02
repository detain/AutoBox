# Upgrade pip and setuptools
python -m pip install -U pip setuptools

# Install pip packages
pip install flexget
pip install python-language-server
pip install --upgrade autopep8

$configpath = "$env:UserProfile\flexget"
$configfiles = "F:\Misc\Flexget\*"
xcopy $configfiles $configpath /Y
