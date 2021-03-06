Import-Module -Name "..\functionsAndCmdlets\Invoke-SQLQuery.psm1"
Import-Module -Name "..\functionsAndCmdlets\Get-FileNameWithDate.psm1"
Import-Module -Name "..\functionsAndCmdlets\New-File.psm1"
Import-Module -Name "..\functionsAndCmdlets\Test-Path.psm1"
Import-Module -Name "..\functionsAndCmdlets\Compress-File.psm1"

$backupDirectory = "F:\backup_wapro_2\"
$filePre= "kopiaBazyWapro"
$DbServer="MARCING\ADAMPOL"
$DbName="ADAMPOL_WAPRO"
$fileName = Get-FileNameWithDate -fileName $filePre -fileExtension '.bak'
$backupPath = $backupDirectory + $fileName
$zipPath = $backupPath + '.7z'

Write-Host "KOPIA BAZY WF_GANG"
Write-Host "PROSZE NIE PRZERYWAC OPERACJI!!!!"
Write-Host "Kopia do $zipPath"
$query =  "BACKUP DATABASE $DbName TO DISK ='$backupPath' WITH NAME= 'kopia zapasowa', FORMAT" 
$querySuccess = Invoke-SQLQuery -credentialPath "DBPASS" -dbServer $DbServer -Query $query
if ($querySuccess) {
    $compressSuccess = Compress-File -filePath $backupPath -compressedPath $zipPath
    if ($compressSuccess) {
        Write-Host "Operacja zakonczona powodzeniem"
    }    
 Remove-Item -Path $backupPath
}
Write-Host "Koniec operacji"
