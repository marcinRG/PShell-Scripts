function addNumbers() {
    for($I = 1; $I -lt 100000; $I++ )
    {
        Write-Progress -Activity Updating -Status 'Progress->' -PercentComplete "$($I/1000)" -CurrentOperation OuterLoop 
    }
}

$x = addNumbers

for($I = 1; $I -lt 100000; $I++ )
{
    Write-Progress -Activity Updating -Status 'Progress->' -PercentComplete "$($I/1000)" -CurrentOperation OuterLoop
}

