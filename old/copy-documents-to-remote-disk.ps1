Import-Module "D:\PS-scripts\utilities.ps1"
Clear-Host

Clear-Host
$backupDirectory = "D:\backup_dokumenty"
$secondBackUpDirectory = "\\DISKSTATION\backup_dokumenty"
$date7DaysAgo = Get-Previous-Date -daysAgo 7
Copy-Backup-Directory -oldBackup $backupDirectory -newBackup $secondBackUpDirectory -date $date7DaysAgo