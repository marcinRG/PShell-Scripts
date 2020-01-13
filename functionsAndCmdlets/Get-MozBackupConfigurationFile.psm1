Import-Module -name ".\Get-FileNameWithDate"
Import-Module -name ".\New-File.psm1"

Function Get-MozBackupConfigurationFile{Param($outputDirectory,$outputFileName,$configPath, $profile ="Default",$action ="backup",$application="Thunderbird", $configFileName ="mozbackup.mozprofile")

Write-Host 'Creating backup config file'

# $file = Get-FileNameWithDate -fileName $outputFileName -fileExtension '.pcv'
# Write-Host $file

# $filePath = $outputDirectory + $file
# Write-Host $filePath

# $mozillaBackupConfigurationFile = @"
# [General]
# action=$action
# application=$application
# profile=$profile
# output=$filePath
# password=
# "@

 $configFile = New-File -path $configPath -fileName $configFileName
#  $configFilePath = $configPath + $configFileName

#  if (Test-Path -filePath $configFilePath) {
#    Set-Content -Path $configFilePath -Value $mozillaBackupConfigurationFile
#    return $configFile
#  } 
}