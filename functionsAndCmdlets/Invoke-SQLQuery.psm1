Function Invoke-SQLQuery {Param ($credentialPath, $DBServer, $Query)
  try {
   $credential = Get-StoredCredential -Target $credentialPath -ASCredentialObject -ErrorAction Stop
   invoke-Sqlcmd -ServerInstance $DBServer -Username $credential.UserName -Password $credential.Password -Query $Query -QueryTimeout 700 -ErrorAction Stop
   return $true
  } 
  catch {
      Write-Host "Error!!!: $_"
      return $false
  }
}
