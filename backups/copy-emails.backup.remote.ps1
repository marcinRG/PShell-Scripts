Import-Module -Name "..\functionsAndCmdlets\Get-FileNameWithDate.psm1"
Import-Module -Name "..\functionsAndCmdlets\Get-FilesWithDate.psm1"
Import-Module -Name "..\functionsAndCmdlets\Copy-BackupDirectory.psm1"
Import-Module -Name "..\functionsAndCmdlets\Test-Path.psm1" 
Import-Module -Name "..\functionsAndCmdlets\Get-PreviousDate.psm1"


$backupDirectory = "D:\backup_poczta\"
$secondBackUpDirectory = "\\DISKSTATION\backup_poczta\"
$date7DaysAgo = Get-PreviousDate -daysAgo 7
Clear-Host
Write-Host "KOPIA ZAPASOWA POCZTA na \\DISKSTATION"
Copy-BackupDirectory -oldBackup $backupDirectory -newBackup $secondBackUpDirectory -date $date7DaysAgo
Write-Host "KOPIOWANIE ZAKONCZONE"