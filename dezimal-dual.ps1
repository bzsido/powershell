cls

$bi = @(); $erg = @()
$egg = $true

do {
    $n = Read-Host "Bitte geben Sie eine ganze Zahl zwischen 0 und 255 ein!"

    if ($n -match "^\d+$") {
        $n = [int]$n
        if ($n -ge 0 -and $n -le 255) {
            $egg = $false
        }
        else {
            Write-Host "Die eingegebene Zahl ist zu groß!"
        }
    }
} while ($egg)

$dec = $n

while ($dec) {
    $rest = $dec % 2
    #Write-Host "Reste ist $rest" -ForegroundColor Cyan
    $dec = [Math]::Truncate($dec / 2)
    #Write-Host "Dezimalzahl ist $dec" -ForegroundColor Cyan
    $bi += $rest
}

$lenno = $bi.Length - 1

while ($lenno -ge 0) {
    $erg += $bi[$lenno]
    $lenno--
}

Write-Host "Die Dezimalzahl $n lässt sich im Binärsystem als $erg darstellen"