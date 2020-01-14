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