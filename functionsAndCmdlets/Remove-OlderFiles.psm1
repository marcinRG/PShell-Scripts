Import-Module -Name ".\Get-FilesWithDate.psm1" -Verbose 
Import-Module -Name ".\Get-PreviousDate.psm1" -Verbose

Function Remove-OlderFiles {Param ($path, $monthsAgo)

$dateMonthsAgo = Get-PreviousDate -monthsAgo $monthsAgo
Get-FilesWithDate -directory $path -date $dateMonthsAgo -older $true | ForEach-Object {
    $fileName = $_.Name 
    Write-Host "Usuwam plik: $fileName"
    Remove-Item -Path $_.FullName -Force -Recurse -ErrorAction SilentlyContinue
}
}