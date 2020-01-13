# Import-Module "..\cmdlets\Get-MozBackupConfigurationFile.psm1"
Import-Module -Name "..\functionsAndCmdlets\Test-Path.psm1"
Import-Module -Name "..\functionsAndCmdlets\Get-MozBackupConfigurationFile.psm1"

$configPath = "..\backups"
$mozbackupFile = "mozbackup.mozprofile"

Clear-Host
Write-Host "Mozilla Thunderbird Backup"
Write-Host $configPath
Write-Host $mozbackupFile
Write-Host "Test if path: $($configPath) exist"
$bool = Test-Path -filePath $configPath
Write-Host $bool
$file = Get-MozBackupConfigurationFile -outputDirectory "D:\backup_poczta\" -outputFileName "thunderbird_backup"  -configPath $configPath -configFileName $mozbackupFile

#$file = $configPath + $mozbackupFile
#mozbackup $file