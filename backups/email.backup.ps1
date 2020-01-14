Import-Module -Name "..\functionsAndCmdlets\Get-FileNameWithDate.psm1" -Verbose
Import-Module -Name "..\functionsAndCmdlets\New-File.psm1" -Verbose
Import-Module -Name "..\functionsAndCmdlets\Test-Path.psm1" -Verbose
Import-Module -Name "..\functionsAndCmdlets\Get-MozBackupConfigurationFile.psm1" -Verbose

$configPath = "..\settings\"
$mozbackupFile = "mozbackup.mozprofile"

Clear-Host
Write-Host "Mozilla Thunderbird Backup"
$file = Get-MozBackupConfigurationFile -outputDirectory "D:\backup_poczta\" -outputFileName "thunderbird_backup"  -configPath $configPath -configFileName $mozbackupFile
Write-Host $file

$filePath = $configPath + $mozbackupFile
#mozbackup $filePath