Function Test-Path { Param($filePath)
    if ($filePath) {
       return $true
     }
    return $false
   }