Import-Module -Name "..\functionsAndCmdlets\Get-FileNameWithDate.psm1"
Import-Module -Name "..\functionsAndCmdlets\Get-FilesWithDate.psm1"
Import-Module -Name "..\functionsAndCmdlets\Copy-BackupDirectory.psm1"
Import-Module -Name "..\functionsAndCmdlets\Test-Path.psm1" 
Import-Module -Name "..\functionsAndCmdlets\Get-PreviousDate.psm1"


$backupDirectory = "D:\backup_wapro\"
$secondBackupDirectory = "\\DISKSTATION\backup_wapro"
Clear-Host
Write-Host "KOPIA ZAPASOWA BAZ DANYCH na \\DISKSTATION"
$date7DaysAgo = Get-PreviousDate -daysAgo 7
Copy-BackupDirectory -oldBackup $backupDirectory -newBackup $secondBackUpDirectory -date $date7DaysAgo
Write-Host "KOPIOWANIE ZAKONCZONE"