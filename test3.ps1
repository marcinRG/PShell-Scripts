# $path = "G:\Nowy folder"
$path = "G:\Nowy folder\test"
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
    If ($allFilesCount -gt 500) {
        Write-Progress -Activity "Searching from duplicates..." -Status "$($count) of $($allFilesCount) files complete" -PercentComplete "$([math]::Round(100*($count/$allFilesCount)))";
    }
    $extension = $_.Extension
    $length = $_.Length
    $name = $_.Name
    $file = $_
    $duplicates = $files | Where-Object { ($_.CountValue -gt $count) -and ($_.Name -ne $name) -and 
            ($_.Length -eq $length) -and ($_.Extension -eq $extension)}
    if ($duplicates.Count -gt 0) {
        $file.Duplicates = $duplicates
        $count = $file.CountValue + $duplicates.Count
    }        
}
$output = $files | Where-Object {$_.Duplicates.Count -gt 0}

Write-Output "--------------------------------"
$output | Select-Object -Property Name, @{Name="DuplicatesCount";Expression={$_.Duplicates.Count}}
Write-Output "---------------------------------"
Write-Output "number of files with duplicates: $($output.Count)"