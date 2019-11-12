Import-Module ".\cmdlets\Test-Path.psm1"
Import-Module ".\cmdlets\Get-PreviousDate.psm1"
Import-Module ".\cmdlets\New-File.psm1"

Clear-Host
$path = 'D:\'
$fileName = "costam.txt"
Write-Host "Test if path: $($path) exist"
Test-Path -filePath $path
Write-Host "Creating new file" 
if (New-File -path $path -fileName $fileName) {
    Write-Host "File was created"
}

Write-Host ""
Write-Host "Date 10 days ago"
$date1 = Get-PreviousDate -daysAgo 10
Write-Host $date1
Write-Host ""
Write-Host "Date 2 months ago"
$date2 = Get-PreviousDate -monthsAgo 2
Write-Host $date2

#.\utils\youtube-dl.exe https://www.youtube.com/watch?v=Z6kNQEzQJpA