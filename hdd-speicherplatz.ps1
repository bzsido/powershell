$HDDs = Get-CimInstance -ClassName Win32_LogicalDisk | ? {$_.DriveType -eq 3}

$HDDs | Select -Property DeviceID,DriveType,Size,FreeSpace `
      | ft -Property @{Label = "Servername"; Expression = {$env:COMPUTERNAME}},`
                      DeviceID,Size,FreeSpace,`
                      @{Label="Percent"; Expression = {% {[Math]::Truncate((($_.FreeSpace / $_.Size)*100))}}},`
                      @{Label="Warning"; Expression = {% -process {if ([Math]::Truncate((($_.FreeSpace / $_.Size)*100)) -le 30) {"Less than 30% free space!"}}}}