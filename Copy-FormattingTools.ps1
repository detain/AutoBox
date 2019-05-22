$configpath = "$env:UserProfile"
$configfiles = "$env:UserProfile\Documents\Configs\*"
xcopy $configfiles $configpath /Y
