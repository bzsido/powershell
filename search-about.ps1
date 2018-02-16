<#
.synopsis
This script helps you to search through your about_ topics in case your locales are
not configured as en-US.
#>

$in=read-host "Please enter the about_ topic to search for"
ls C:\Windows\system32\WindowsPowerShell\v1.0\en-US | Where-Object {$_.name -like "*$in*"}

$a=(ls C:\Windows\system32\WindowsPowerShell\v1.0\en-US | Where-Object {$_.name -like "*$in*"})

#write-host "Output of Select-Object"
#$a | Select-Object -Property Name
write-host "Properties of B:"
$b=$a | Select-Object -Property Name | Get-Member

write-host "B0:" $b[0]
write-host "B1:" $b[1]

if ($b[0] -and $b[1]) {

    write-host "Please specify your search to one topic. `
    Here are the possible choices:"
    $a
}

else {

    
}

# if we have only one file, open it
# if we have multiple files, display it to the user and let him specify the exact one
# open content with more