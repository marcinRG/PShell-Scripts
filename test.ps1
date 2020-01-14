Import-Module -Name ".\functionsAndCmdlets\Get-FileNameWithDate.psm1" -Verbose
Import-Module -Name ".\functionsAndCmdlets\New-File.psm1" -Verbose
Import-Module -Name ".\functionsAndCmdlets\Test-Path.psm1" -Verbose
Import-Module -Name ".\functionsAndCmdlets\Get-MozBackupConfigurationFile.psm1" -Verbose
Import-Module -Name ".\functionsAndCmdlets\Get-FilesWithDate.psm1" -Verbose
Import-Module -Name ".\functionsAndCmdlets\Copy-BackupDirectory.psm1" -Verbose
Import-Module -Name ".\functionsAndCmdlets\Get-PreviousDate.psm1" -Verbose
Import-Module -Name ".\functionsAndCmdlets\Invoke-SQLQuery.psm1" -Verbose
Import-Module -Name ".\functionsAndCmdlets\Compress-File.psm1" -Verbose

Clear-Host
$path = "D:\backup_dokumenty\"

$date1MonthAgo = Get-PreviousDate -monthsAgo 1
Write-Host $date4MonthsAgo
$files = Get-FilesWithDate -directory $path -date $date1MonthAgo -older $true
Write-Host "POCZATEK"
#$files = Get-ChildItem $path
for ($i=0; $i -lt $files.Count; $i++) {
    Write-Host $files[$i].FullName
}
Write-Host "KONIEC"

#.\utils\youtube-dl.exe https://www.youtube.com/watch?v=Z6kNQEzQJpA