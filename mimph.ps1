cls
Write-Host "Wilkommen in dem Dezimal zu Dualzahl Rechner. Zum Programmende drücken Sie Strg+C" -f yellow

$murph = @()
$AAA = $true
$i = 0

# filtering user input
do {
    $egg = Read-Host "Geben Sie eine ganze Zahl zwischen 0 und 255 ein!"

    if ($egg -match "^\d+$") {
        $egg = [int]$egg
        $fibsh = $egg
        
        if ($egg -ge 0 -and $egg -le 255) {
            $AAA = $false
        }

        else {
            Write-Host "Der eingegebene Zahl ist nicht zwischen 0 und 255!"
        }
    }

    else {
        Write-Host "Bitte geben Sie nur Ziffern ein!"
    }

} while($AAA)

while ($egg -gt 0) {
    
    Write-Host "Die Zahl ist $egg"

    # getting modulo 2 and adding it to the array
    $mimph = $egg % 2
    $murph += $mimph

    Write-Host "$egg Modulo 2 ergibt $mimph"

    $egg = [Math]::Truncate($egg / 2)
}

# array must be reversed
[array]::Reverse($murph)

Write-Host "Der eingegebene Zahl $fibsh kann als $murph dargestellt werden im Dualsystem."