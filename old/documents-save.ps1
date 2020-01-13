Import-Module "D:\PS-scripts\utilities.ps1"
Clear-Host
$documentsPath = "C:\Users\Marcin\Documents"
Write-Output "Kopia folderu moje dokumenty"
Write-Output "Proszê nie przerywaæ operacji!!!"
$backupDirectory = "D:\backup_dokumenty\"
$filePre= "kopia_Dokumenty"
Write-Output "Kopia do $backupDirectory"
$zipFile = Create-FileNameWithDate -fileName $filePre -fileExtension '.7z'
$zipPath = $backupDirectory + $zipFile
Compress-File -filePath $documentsPath -compressedPath $zipPath
Write-Output "Koniec operacji"