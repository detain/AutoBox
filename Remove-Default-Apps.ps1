#   Description:
# This script removes unwanted Apps that come with Windows. If you  do not want
# to remove certain Apps comment out the corresponding lines below.

Import-Module -DisableNameChecking $PSScriptRoot\lib\take-own.psm1
Import-Module -DisableNameChecking $PSScriptRoot\lib\force-mkdir.psm1

Write-Output "Elevating privileges for this process"
do {} until (Elevate-Privileges SeTakeOwnershipPrivilege)

Write-Output "Uninstalling default apps"
$apps = @(
  "king.com.CandyCrushSaga"
  "king.com.CandyCrushSodaSaga"
  "king.com.*"
  "D52A8D61.FarmVille2CountryEscape"
  "GAMELOFTSA.Asphalt8Airborne"
  "flaregamesGmbH.RoyalRevolt2"
  "Playtika.CaesarsSlotsFreeCasino"
  "A278AB0D.MarchofEmpires"
)

foreach ($app in $apps) {
  Write-Output "Trying to remove $app"

  Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage

  Get-AppXProvisionedPackage -Online |
    Where-Object DisplayName -EQ $app |
    Remove-AppxProvisionedPackage -Online
}

# Prevents "Suggested Applications" returning
force-mkdir "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableWindowsConsumerFeatures" 1
