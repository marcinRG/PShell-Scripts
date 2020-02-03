
Import-Module -Name ".\functionsAndCmdlets\Get-Duplicates.psm1" -Verbose
$path = "D:\rozne\filums"

Clear-Host
Get-Duplicates -path $path
