Import-Module -Name ".\functionsAndCmdlets\Get-FilesWithDate.psm1" 
Import-Module -Name ".\functionsAndCmdlets\Get-PreviousDate.psm1"


#Clear-Host
$path = "F:\backup_poczta_2\"
$months = 17
Write-Host "USUWANIE PLIKOW STARSZYCH NIZ $months MIESIECY Z KATALOGU $path"
Write-Host "POCZATEK"

$dateMonthsAgo = Get-PreviousDate -monthsAgo $months
Write-Host "----------------------------"
Get-FilesWithDate -directory $path -date $dateMonthsAgo -older $true | ForEach-Object {
    $fileName = $_.Name 
    Write-Host "Usuwam plik: $fileName"
    Remove-Item -Path $_.FullName -Force -Recurse -ErrorAction SilentlyContinue
}
Write-Host "----------------------------"
Write-Host "KONIEC"
