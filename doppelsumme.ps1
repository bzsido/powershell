$j = 1
$i = 2
$dsum = 0

$n = Read-Host "Bitte geben Sie eine positive ganze Zahl ein!"

while($i -le $n) {

    while($j -le $i) {
    
        $z = $j+$i
        Write-Host "j + i ist $z" -f Green
        $sq = [Math]::Pow($z,2)
        $dsum += $sq
        write-host "j ist $j , die Summe ist soweit $dsum" -f Green
        $j++
    }
    $i++
    $z = $i + $j
    Write-Host "i + j ist $z" -f Yellow
    $sq = [Math]::Pow($z,2)
    Write-Host "sq ist $sq" -f Yellow
    $dsum += $sq
    write-host "i ist $i , die Summe ist soweit $dsum" -f Yellow
}

Write-Host "Die Endsumme ist $dsum"