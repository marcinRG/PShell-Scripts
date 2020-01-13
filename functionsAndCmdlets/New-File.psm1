Function New-File { Param($path, $fileName)
    $filePath = $path + $fileName
    try {
      return New-Item -Path $filePath -ItemType file -ErrorAction Stop
    }
    catch {
       Write-Host "Error!!!: $_"
       return $false
    }
  }