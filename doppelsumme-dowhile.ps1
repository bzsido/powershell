cls

$i = 2
$dsum = 0
$egg = $true

do {
    $n = Read-Host "Geben Sie einen natürlichen Zahl größer als 0 ein!"

    if ($n -match "^[1-9]{1}\d*$") {
        $n = [int]$n
        $egg = $false
    }

    elseif ($n -match "^0+$") {
        Write-Host "Auf Wiedersehen!"
        exit
    }

} while ($egg)

do {
    
    $j = 1
    $isum = 0

    do {
    
        $ijsum = $i + $j
        $isum += $ijsum * $ijsum
        Write-Host "i ist $i, j ist $j, addiert $ijsum" -ForegroundColor Cyan
        Write-Host "Die innere Summe ist $isum" -ForegroundColor Cyan
        $j++

    } while ($j -le $i)
    
    $dsum += $isum
    Write-Host "Die Doppelsumme ist $dsum" -ForegroundColor Yellow
    $i++

} while ($i -le $n)