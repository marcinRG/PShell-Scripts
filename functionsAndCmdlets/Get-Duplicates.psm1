Function Get-Duplicates {
    Param($path)

    $emptyArray = @()

    $files = Get-ChildItem -path $path -Recurse -File | Sort-Object -Property Length, Extension, Name | 
    ForEach-Object {
        $_ | Add-Member -membertype noteproperty -name CountValue -value $i -PassThru | Add-Member -membertype noteproperty -name Duplicates -value $emptyArray -PassThru
        $i = $i + 1
    } | Sort-Object -Property CountValue

    $allFilesCount = $files.Count
    $duplicates = @()
    $count = 0
    $files | ForEach-Object {
        Write-Progress -Activity "Searching from duplicates..." -Status "$($count) of $($allFilesCount) files complete" -PercentComplete "$([math]::Round(100*($count/$allFilesCount)))";
        $extension = $_.Extension
        $length = $_.Length
        $name = $_.Name
        $file = $_
        $duplicates = $files | Where-Object { ($_.CountValue -gt $count) -and ($_.Name -ne $name) -and 
            ($_.Length -eq $length) -and ($_.Extension -eq $extension) }
        if ($duplicates.Count -gt 0) {
            $file.Duplicates = $duplicates
            $count = $file.CountValue + $duplicates.Count
        }        
    }
    $output = $files | Where-Object { $_.Duplicates.Count -gt 0 }
    return $output
}