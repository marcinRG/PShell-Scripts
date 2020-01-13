Function Get-FilesWithDate { Param($directory,$date,$older)
    if ($older) {
       return Get-ChildItem -Path $directory | Where-Object {$_.LastWriteTime -le $date}
    }
    return Get-ChildItem -Path $directory | Where-Object {$_.LastWriteTime -gt $date}
  }