function Restart-Explorer {
  <#
.SYNOPSIS
Restarts the Explorer.exe process in Windows.
Author: @mwrock

.DESCRIPTION
Restarts Explorer.exe in Windows after making changes to it's configuration.

.EXAMPLE
Restart-Explorer

.INPUTS None

.OUTPUTS None

.LINK

https://github.com/mwrock
#>


  try {
    Write-Output "Restarting the Windows Explorer process..."
    $user = Get-CurrentUser
    try { $explorer = Get-Process -Name explorer -ErrorAction stop -IncludeUserName }
    catch {$global:error.RemoveAt(0)}

    if ($explorer -ne $null) {
      $explorer | ? { $_.UserName -eq "$($user.Domain)\$($user.Name)"} | Stop-Process -Force -ErrorAction Stop | Out-Null
    }

    Start-Sleep 1

    if (!(Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
      $global:error.RemoveAt(0)
      start-Process -FilePath explorer
    }
  }
  catch {$global:error.RemoveAt(0)}
}
