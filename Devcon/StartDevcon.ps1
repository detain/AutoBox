$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
$name = "Devcon"
$value = "`"$ENV:UserProfile\Desktop\Github\AutoBox\Devcon\DevConRestart.exe`""

New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType String -Force | Out-Null
