Import-Module "D:\PS-scripts\utilities.ps1"
Clear-Host

Clear-Host
$backupDirectory = "D:\backup_poczta"
$secondBackUpDirectory = "\\DISKSTATION\backup_poczta"
$date7DaysAgo = Get-Previous-Date -daysAgo 7
Copy-Backup-Directory -oldBackup $backupDirectory -newBackup $secondBackUpDirectory -date $date7DaysAgo
