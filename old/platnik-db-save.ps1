
Import-Module "D:\PS-scripts\utilities.ps1"

Clear-Host
$backupDirectory = "D:\backup_wapro\"
$filePre= "kopiaBazyPlatnik"
$DbServer="MARCINKOMP"
$DbName="ADAMPOL_PLATNIK"
$fileName = Create-FileNameWithDate -fileName $filePre -fileExtension '.bak'
$backupPath = $backupDirectory + $fileName
$zipPath = $backupPath + '.7z'

Write-Output "Kopia bazy danych płatnik"
Write-Output "Proszę nie przerywać operacji!!!"
Write-Output "Kopia do $zipPath"
$query =  "BACKUP DATABASE $DbName TO DISK ='$backupPath' WITH NAME= 'kopia zapasowa', FORMAT" 
Run-Query-SQL -credentialPath "localhost\MARCINKOMP" -dbServer $DbServer -Query $query
Compress-File -filePath $backupPath -compressedPath $zipPath
Remove-Item -Path $backupPath

Write-Output "Koniec operacji"