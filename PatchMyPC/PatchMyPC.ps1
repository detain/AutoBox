. .\Download-File.ps1

# Download file
$url = "https://patchmypc.net/freeupdater/PatchMyPC.exe"
$path = (Get-Location).Path
Download-File $url  $path\PatchMyPC

# Run PatchMyPC
.\PatchMyPC\PatchMyPC.exe /s
