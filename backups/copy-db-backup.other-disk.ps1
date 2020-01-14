Import-Module -Name "..\functionsAndCmdlets\Get-FileNameWithDate.psm1"
Import-Module -Name "..\functionsAndCmdlets\Get-FilesWithDate.psm1"
Import-Module -Name "..\functionsAndCmdlets\Copy-BackupDirectory.psm1"
Import-Module -Name "..\functionsAndCmdlets\Test-Path.psm1" 
Import-Module -Name "..\functionsAndCmdlets\Get-PreviousDate.psm1"


$backupDirectory = "D:\backup_wapro\"
$secondBackupDirectory = "G:\backup_wapro_2\"
Clear-Host
Write-Host "KOPIA ZAPASOWA BAZ DANYCH"
$date1DayAgo = Get-PreviousDate -daysAgo 1
Copy-BackupDirectory -oldBackup $backupDirectory -newBackup $secondBackUpDirectory -date $date1DayAgo
Write-Host "KOPIOWANIE ZAKONCZONE"
