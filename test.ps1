# Import-Module -name ".\functionsAndCmdlets\Test-Path.psm1"
# Import-Module -name ".\functionsAndCmdlets\New-File.psm1"
# Import-Module -name ".\functionsAndCmdlets\Get-PreviousDate.psm1"
Import-Module -Name ".\functionsAndCmdlets\Get-MozBackupConfigurationFile.psm1" -Verbose

$file = 'costam'
$ext = '.txt'



# Clear-Host
# $path = 'D:\test\'
# $fileName = "costam.txt"
# Write-Host "Test if path: $($path) exist"
# $bool = Test-Path -filePath $path
# Write-Host $bool
# Write-Host "Creating new file: $($fileName) in the directory: $($path)" 
# if (New-File -path $path -fileName $fileName) {
#     Write-Host "File was created"
# }

# Write-Host ""
# Write-Host "Date 10 days ago"
# $date1 = Get-PreviousDate -daysAgo 10
# Write-Host $date1
# Write-Host ""
# Write-Host "Date 2 months ago"
# $date2 = Get-PreviousDate -monthsAgo 2
# Write-Host $date2

#.\utils\youtube-dl.exe https://www.youtube.com/watch?v=Z6kNQEzQJpA