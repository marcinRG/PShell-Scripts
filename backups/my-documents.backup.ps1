Import-Module -Name "..\functionsAndCmdlets\Get-FileNameWithDate.psm1"
Import-Module -Name "..\functionsAndCmdlets\Test-Path.psm1"
Import-Module -Name "..\functionsAndCmdlets\Compress-File.psm1"

Clear-Host
$documentsPath = "C:\Users\Marcin\Documents"
$tempDirectory = "F:\backup_dokumenty_2\Temp"
$backupDirectory = "F:\backup_dokumenty_2\"
$filePre = "kopia_Dokumenty"

Write-Host "KOPIA MOJE DOKUMENTY"
Write-Host "PROSZE NIE PRZERYWAæ OPERACJII!!!"
Write-Host "Kopia do $backupDirectory"

Copy-Item -Path $documentsPath -Destination $tempDirectory -Recurse -Force -ErrorAction SilentlyContinue

$zipFile = Get-FileNameWithDate -fileName $filePre -fileExtension '.7z'
$zipPath = $backupDirectory + $zipFile
$zipSuccess = Compress-File -filePath $tempDirectory -compressedPath $zipPath
If ($zipSuccess) {
    Write-Host "OPERACJA ZAKONCZONA SUKCESEM"
    Remove-Item -Path $tempDirectory -Force -Recurse -Confirm:$false -ErrorAction SilentlyContinue
}
Write-Host "KONIEC OPERACJI"
