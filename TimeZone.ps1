<#
.SYNOPSIS
    Information about the world time zones..

.DESCRIPTION
    Get-CommonTimeZone is a function that returns information about the world time zones..



.EXAMPLE
     Get-CommonTimeZone -Name 'Asia'
     Get-CommonTimeZone -Offset 1 

.INPUTS
    String
    INT16


.NOTES
    Author:  Vamsi Vijay Kumar
    Email :  vamsivkbarla@gmail.com

#>

function Get-CommonTimeZone {
    [CmdletBinding()]
    param (
     [string] $Name = $null,
     [int16] $Offset = $null
     
     )

$webAPIData = ConvertFrom-JSON (Invoke-WebRequest -uri "https://raw.githubusercontent.com/dmfilipenko/timezones.json/master/timezones.json")
if($Name -and $Offset)
{
    Write-Host " please enter either -name 0r -offset"
}
elseif($Name)
{
$webAPIData | where-object { $_.utc -match $Name }
}
elseif($Offset)
{
if($Offset -ge -12 -and $Offset -le 12){
$webAPIData | where-object { $_.Offset -eq $Offset} }
else {
Write-Host "Please enter Values between -12 to 12 for offset "
}
}

elseif($webAPIData)
{
$webAPIData
}
}

##### End of Script # # # # 
