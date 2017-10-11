<#
.SYNOPSIS
Gets a list of the Windows features available with this version of Windows.

.DESCRIPTION
Gets a list of Windows features and then outputs the list with an indicator as to whether or not
that feature has been enabled on this computer.

.PARAMETER None

.EXAMPLE
.\Get-WindowsFeatures.ps1

.INPUTS

.OUTPUTS

.LINK

https://github.com/JourneyOver/
#>

$output = Dism /online /Get-Features;
$length = $output.count;
$count = 0;
$features = @();
while ($count -le $length) {
  if ($output[$count] -match "Feature Name : ") {
    $FeatureName = $output[$count].Split(":")[1].TrimStart();
    $enabled = $output[$count + 1].Split(":")[1].TrimStart() -eq "Enabled";
    $temp = New-Object PSObject;
    Add-Member -InputObject $temp -MemberType NoteProperty -Name Name -Value $FeatureName;
    Add-Member -InputObject $temp -MemberType NoteProperty -Name Enabled -Value $Enabled;
    $features += $temp;
  }
  $count++;
}
return $features;
