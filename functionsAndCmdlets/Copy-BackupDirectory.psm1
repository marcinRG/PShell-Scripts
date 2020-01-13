Function Copy-BackupDirectory { Param($oldBackup,$newBackup, $date)
    Get-FilesWithDate -directory $oldBackup -date $date -older $false | Copy-Item -Destination $newBackup -Force
  }