Import-Module "D:\PS-scripts\utilities.ps1"

$configPath = "D:\PS-scripts\"
$mozbackupFile = "mozbackup.mozprofile"


Clear-Host
Create-MozBackup-Configuration-File -outputDirectory "D:\backup_poczta\" -outputFileName "thunderbird_backup"  -configPath $configPath -configFileName $mozbackupFile
$file = $configPath + $mozbackupFile
mozbackup $file