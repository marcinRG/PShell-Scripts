Import-Module -Name "..\functionsAndCmdlets\Get-FileNameWithDate.psm1"
Import-Module -Name "..\functionsAndCmdlets\New-File.psm1"
Import-Module -Name "..\functionsAndCmdlets\Test-Path.psm1"
Import-Module -Name "..\functionsAndCmdlets\Get-MozBackupConfigurationFile.psm1"

$configPath = "..\settings\"
$mozbackupFile = "mozbackup.mozprofile"
$outputDir = "F:\backup_poczta_2\"

Clear-Host
Write-Host "Mozilla Thunderbird Backup"
$file = Get-MozBackupConfigurationFile -outputDirectory $outputDir -outputFileName "thunderbird_backup"  -configPath $configPath -configFileName $mozbackupFile
Write-Host $file

$filePath = $configPath + $mozbackupFile
..\utils\MozBackup-1.5.1-EN\MozBackup $filePath
