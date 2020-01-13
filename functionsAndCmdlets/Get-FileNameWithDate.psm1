Function Get-FileNameWithDate {Param ($fileName,$fileExtension)
    return $fileName + "_" + (Get-Date).ToString("yyyy_MM_dd_hh_mm") + $fileExtension
 } 