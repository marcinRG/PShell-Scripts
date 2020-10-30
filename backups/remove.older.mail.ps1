Import-Module -Name "..\functionsAndCmdlets\Remove-OlderFiles.psm1"

#Clear-Host
$path = "F:\backup_poczta_2\"
$months = 5

Write-Host "USUWANIE Backup�w poczty starszej ni� $months miesi�y z katalogu $path"
Write-Host "Pocz�tek"
Write-Host "----------------------------"

Remove-OlderFiles -path $path -monthsAgo $months

Write-Host "----------------------------"
Write-Host "Koniec"
