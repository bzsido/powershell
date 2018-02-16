$a = Read-Host "Bitte geben Sie 'a' ein!"
$b = Read-Host "Bitte geben Sie 'b' ein!"
$c = Read-Host "Bitte geben Sie 'c' ein!"

if ($a -eq 0 -and $b -eq 0) {
    if ($c -eq 0) {
        Write-Host "Die Funktion ist eine gerade Linie auf der X Achse. Es hat unendlich viele Nullstellen"
    }
    else {
        Write-Host "Die Funktion ist eine gerade Linie parallel zu der x Achse. Es gibt keine Nullstellen"
    }
}

elseif ($a -eq 0 -and $b -ne 0) {
    $x = -$c/$b
    Write-Host "Die Funktion ist eine gerade Linie die den x Achse an einem Punkt trifft."
    Write-Host "Die Nullstelle ist $x"
}

elseif ($a -ne 0) {
    $p = $b/$a
    $q = $c/$a

    $x1 = -($p/2) + [Math]::Sqrt([Math]::Pow($p/2, 2) - $q)
    $x2 = -($p/2) - [Math]::Sqrt([Math]::Pow($p/2, 2) - $q)

    $D = [Math]::Sqrt($p/2) - $q

    if ($D -lt 0) {
        Write-Host "Es gibt keine Nullstellen."
    }
    elseif ($D -eq 0) {
        Write-Host "Es gibt eine Nullstelle."
        Write-Host "Die Loesung: X1 = $x1 X2 = $x2 D = $D"
    }
    else {
        Write-Host "Es gibt zwei Nullstellen."
        Write-Host "Die Loesung: X1 = $x1 X2 = $x2 D = $D"
    }
}