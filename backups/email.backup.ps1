Import-Module "..\cmdlets\Get-MozBackupConfigurationFile.psm1"
$configPath = "..\backups"
$mozbackupFile = "mozbackup.mozprofile"

Clear-Host
Write-Host "Mozilla Thunderbird Backup"
$file = Get-MozBackupConfigurationFile -outputDirectory "D:\backup_poczta\" -outputFileName "thunderbird_backup"  -configPath $configPath -configFileName $mozbackupFile

#$file = $configPath + $mozbackupFile
#mozbackup $file