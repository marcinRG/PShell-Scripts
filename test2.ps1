Clear-Host
#$path = "D:\test\obrazki"
#$path = "D:\rozne"
$path = "G:\Nowy folder\AGA-COMBO"

$i=0
$files = Get-ChildItem -path $path -Recurse -File | Sort-Object -Property Length, Extension, Name | 
ForEach-Object {
    $_ | Add-Member -membertype noteproperty -name CountValue -value $i -PassThru
    $i = $i + 1
} | Sort-Object -Property CountValue

$numberOfFiles = $files | Measure-Object | Select-Object -expandProperty count

$j=1
Write-Output "List all files with the same length and file type"
Write-Output "directory: $($path), number of files: $($numberOfFiles)"
Write-Output "------------------------------------------"
$files | ForEach-Object {
    
    $extension = $_.Extension
    $length = $_.Length
    $name = $_.Name
    $count = $_.CountValue
    $hasDuplicates = $false
    $output = ("`n File: $($name) duplicates found: $($j) `n")
    $files | Where-Object { ($_.CountValue -gt $count) -and ($_.Name -ne $name) -and 
        ($_.Length -eq $length) -and ($_.Extension -eq $extension) 
    } | ForEach-Object {
       $hasDuplicates = $true 
       $output = ($output + "duplicate:" + $_.Name + "`n")
    }

    if ($hasDuplicates) {
        $output = $output + "______________________"
        Write-Output $output
        $j=$j+1
    }
    
}

Write-Output "------------------------------------------"
#count all files