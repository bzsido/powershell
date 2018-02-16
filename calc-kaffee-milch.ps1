$i = 0
$sum = 0

Write-Host "`nIAS Kaffee & Milch Kalkulator`n"
Write-Host "Um das Programm zu schliessen, geben Sie eine Buchstabe oder Wort ein! `n"

while ($true) {

    if ($i % 2 -eq 0) {
        Write-Host "KAFFEE"
    }

    if ($i % 2 -eq 1) {
        Write-Host "MILCH"
    }

    $funfer = Read-Host "Bitte geben Sie den Anzahl der Fuenfer-Striche ein!"
    $einzel = Read-Host "Bitte geben Sie den Anzahl der Einzelstriche ein!"

    if ($funfer -match "\d+" -and $einzel -match "\d+") {
        $erg = [int]$funfer*5 + [int]$einzel
        Write-Host "`nDas sind insgesamt $erg Striche"

        if ($i % 2 -eq 0) {
            $kaff = $erg*0.15
            Write-Host "Die Preis von Kaffee ist $kaff"
            $sum += $kaff
        }

        if ($i % 2 -eq 1) {
            $milch = $erg*0.1
            Write-Host "Die Preis von Milch ist $milch"
            $sum += $milch
            Write-Host "`nDie Summe ist - $sum`n"
            $sum = 0
        }
    }

    else {
        break
    }

    $i++
}
