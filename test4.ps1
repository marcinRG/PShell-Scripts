Import-Module -Name ".\functionsAndCmdlets\Get-Duplicates.psm1" -Verbose

$path = "D:\rozne"

$output = Get-Duplicates -path $path

Write-Output "--------------------------------"
$output | Select-Object -Property Name, @{Name="DuplicatesCount";Expression={$_.Duplicates.Count}}
Write-Output "---------------------------------"
Write-Output "number of files with duplicates: $($output.Count)"
