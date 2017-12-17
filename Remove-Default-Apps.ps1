#   Description:
# This script removes unwanted Apps that come with Windows.

Import-Module -DisableNameChecking $PSScriptRoot\lib\take-own.psm1
Import-Module -DisableNameChecking $PSScriptRoot\lib\force-mkdir.psm1

Write-Output "Elevating privileges for this process"
do {} until (Elevate-Privileges SeTakeOwnershipPrivilege)

Write-Output "Uninstalling default apps"
$apps = @(
  # default Windows 10 apps
  "Microsoft.SkypeApp"
  "Microsoft.MicrosoftOfficeHub"
  "Microsoft.MicrosoftSolitaireCollection"

  # Threshold 2 apps

  # Redstone apps

  # non-Microsoft
  "king.com.BubbleWitch3Saga"
  "king.com.CandyCrushSaga"
  "king.com.CandyCrushSodaSaga"
  "king.com.*"
  "*.DisneyMagicKingdoms*"
  "*.MarchOfEmpires*"
  "*.HiddenCity*"
  "*.FarmVille2CountryEscape*"
  "*.Asphalt8Airborne*"
  "*.RoyalRevolt2*"
  "*.CaesarsSlotsFreeCasino*"
  "*.WinZipUniversal*"
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

Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SilentInstalledAppsEnabled" 0
