# Download and install it
iex (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1")

# Add it to the current user's PowerShell profile
$add = "Import-Module PSReadLine;
Set-PSReadlineKeyHandler -Key Alt+C -Function CaptureScreen;"
$powershell_profile = $env:userprofile + "\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1";
$new_profile = Get-Content $powershell_profile;
if ($new_profile.Contains("Import-Module PSReadLine;") -and $new_profile.Contains("Set-PSReadlineKeyHandler -Key Alt+C -Function CaptureScreen;")) {
  Write-Output "PSReadLine already installed; Skipping installation.";
}
else {
  $new_profile = $new_profile + $add;
  Set-Content -path $powershell_profile -value $new_profile;
  Write-Output "The current user's PowerShell profile has been updated to automatically load PSReadLine.";
}
