Function Create-File { Param($path, $fileName)
  $filePath = $path + $fileName
  try {
    return New-Item -Path $filePath -ItemType file -ErrorAction Stop
  }
  catch {
     Write-Host "Error!!!: $_"
     return $false
  }
}

Function Test-Path { Param($filePath)
 if ($filePath) {
    return $true
  }
 return $false
}

Function Compress-File { Param($filePath,$compressedPath)
  if (Test-Path($filePath)) {
    try {
      Compress-7Zip -Path $filePath $compressedPath -ErrorAction Stop
      return $true
    } catch { 
         Write-Host "Error!!!: $_"
         return $false 
    }
  }
  return $false
}

Function Create-FileNameWithDate {Param ($fileName,$fileExtension)
   return $fileName + "_" + (Get-Date).ToString("yyyy_MM_dd_hh_mm") + $fileExtension
} 

Function Get-Previous-Date {Param ($daysAgo, $monthsAgo)
  $previousDate = Get-Date
  if ($daysAgo) {
     $previousDate = $previousDate.AddDays(-1*$daysAgo)
  }
  if ($monthsAgo) {
    $previousDate = $previousDate.AddMonths(-1*$monthsAgo) 
  }
  return $previousDate
}

Function Run-Query-SQL {Param ($credentialPath, $DBServer, $Query)
  try {
    $credential = Get-StoredCredential -Target $credentialPath –AsCredentialObject -ErrorAction Stop
    invoke-Sqlcmd -ServerInstance $DbServer -Username $credential.UserName -Password $credential.Password -Query $Query -QueryTimeout 700 -ErrorAction Stop
    return $true
  } 
  catch {
    Write-Host "Error!!!: $_"
    return $false 
  }
}

Function Create-MozBackup-Configuration-File{Param($outputDirectory,$outputFileName,$configPath, $profile ="Default",$action ="backup",$application="Thunderbird", $configFileName ="mozbackup.mozprofile")

 $file = Create-FileNameWithDate -fileName $outputFileName -fileExtension '.pcv'
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
}

Function Get-FilesWithDate { Param($directory,$date,$older)
  if ($older) {
     return Get-ChildItem -Path $directory | Where-Object {$_.LastWriteTime -le $date}
  }
  return Get-ChildItem -Path $directory | Where-Object {$_.LastWriteTime -gt $date}
}

Function Copy-Backup-Directory { Param($oldBackup,$newBackup, $date)
  Get-FilesWithDate -directory $oldBackup -date $date -older $false | Copy-Item -Destination $newBackup -Force
}
 