﻿Import-Module "D:\PS-scripts\utilities.ps1"
Clear-Host
$backupDirectory = "D:\backup_dokumenty\"
$secondBackUpDirectory = "G:\backup_dokumenty_2\"
$date7DaysAgo = Get-Previous-Date -daysAgo 7

Copy-Backup-Directory -oldBackup $backupDirectory -newBackup $secondBackUpDirectory -date $date7DaysAgo