<#
.SYNOPSIS
Sets Windows Power profile to 'High Performance'

.DESCRIPTION
Check the PowerScheme on the computer and Assign the Desired One

.PARAMETER None

.EXAMPLE
.\Set-HighPerformancePowerProfile.ps1

.INPUTS

.OUTPUTS

.LINK

https://github.com/JourneyOver/
#>

## I want to Use High performance as Deault PowerScheme ##

# Powerscheme
$a = '8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c'

# Put computer to sleep (d is in seconds, 0 = Never)
$b = '238c9fa8-0aad-41ed-83f4-97be242c8f20'
$c = '29f6c1db-86da-48c5-9fdb-f2b67b1f44da'
$d = '0'

# Turn off the display (g is in seconds, 0 = Never)
$e = '7516b95f-f776-4464-8c53-06167f40cc99'
$f = '3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e'
$g = '0'

# Lets Check what is our Current Active "Power Scheme" and put it on a Variable #

$currScheme = POWERCFG /GETACTIVESCHEME

# Put $CurrScheme in a variable and Split it so that we can get the GUID of Active "Power Scheme" #

$h = $currScheme.Split()

if ($h[3] -eq $a) {

  write-Host -ForegroundColor yellow "You Have The correct Settings, Nothing to Do!!! "

} else {

  Write-Warning "You Have The Wrong Power Scheme Set, let me fix it for you"

  PowerCfg /SetActive $a
  PowerCfg /SETACVALUEINDEX $a $b $c $d
  PowerCfg /SETACVALUEINDEX $a $e $f $g

  write-Host -ForegroundColor Green "PowerScheme Sucessfully Applied"
}
