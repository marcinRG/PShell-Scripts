Import-Module "D:\PS-scripts\utilities.ps1"
Clear-Host
$backupDirectory = "D:\backup_wapro\"
$secondBackUpDirectory = "G:\backup_wapro_2\"
$date5DaysAgo = Get-Previous-Date -daysAgo 1
Copy-Backup-Directory -oldBackup $backupDirectory -newBackup $secondBackUpDirectory -date $date5DaysAgo