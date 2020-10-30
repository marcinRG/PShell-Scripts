Import-Module -Name "..\functionsAndCmdlets\Remove-OlderFiles.psm1"

#Clear-Host
$path = "F:\backup_wapro_2\"
$months = 5

Write-Host "USUWANIE Backup�w Baz danych starszych ni� $months miesi�cy z katalogu $path"
Write-Host "Pocz�tek"
Write-Host "----------------------------"

Remove-OlderFiles -path $path -monthsAgo $months

Write-Host "----------------------------"
Write-Host "Koniec"
