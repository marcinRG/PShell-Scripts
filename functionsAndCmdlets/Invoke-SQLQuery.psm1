Function Invoke-SQLQuery {Param ($credentialPath, $DBServer, $Query)
    try {
      $credential = Get-StoredCredential -Target $credentialPath –AsCredentialObject -ErrorAction Stop
      invoke-Sqlcmd -ServerInstance $DbServer -Username $credential.UserName -Password $credential.Password -Query $Query -QueryTimeout 700 -ErrorAction Stop
      return $true
    } 
    catch {
      Write-Host "Error!!!: $_"
      return $false 
    }
  }