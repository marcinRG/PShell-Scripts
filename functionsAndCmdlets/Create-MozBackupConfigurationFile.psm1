Function Get-MozBackupConfigurationFile{Param($outputDirectory,$outputFileName,$configPath, $profile ="Default",$action ="backup",$application="Thunderbird", $configFileName ="mozbackup.mozprofile")

 $file = Get-FileNameWithDate -fileName $outputFileName -fileExtension '.pcv'
 $filePath = $outputDirectory + $file

$mozillaBackupConfigurationFile = @"
[General]
action=$action
application=$application
profile=$profile
output=$filePath
password=
"@

 $configFile = Create-File -path $configPath -fileName $configFileName
 $configFilePath = $configPath + $configFileName

 if (Test-Path -filePath $configFilePath) {
   Set-Content -Path $configFilePath -Value $mozillaBackupConfigurationFile
 }
 return $configFile 
}
