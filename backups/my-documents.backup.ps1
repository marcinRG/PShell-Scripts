Import-Module -Name "..\functionsAndCmdlets\Get-FileNameWithDate.psm1"
Import-Module -Name "..\functionsAndCmdlets\Test-Path.psm1"
Import-Module -Name "..\functionsAndCmdlets\Compress-File.psm1"

Clear-Host
$documentsPath = "C:\Users\Marcin\Documents"
$backupDirectory = "D:\backup_dokumenty\"
$filePre = "kopia_Dokumenty"

Write-Host "KOPIA MOJE DOKUMENTY"
Write-Host "PROSZE NIE PRZERYWAV OPERACJII!!!"
Write-Host "Kopia do $backupDirectory"

$zipFile = Get-FileNameWithDate -fileName $filePre -fileExtension '.7z'
$zipPath = $backupDirectory + $zipFile
$zipSuccess = Compress-File -filePath $documentsPath -compressedPath $zipPath
If ($zipSuccess) {
    Write-Host "OPERACJA ZAKONCZONA SUKCESEM"
}
Write-Host "KONIEC OPERACJI"