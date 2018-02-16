cls

$egg = $true; $mimph = $false

while ($egg) {
    
    # variables that should be reset
    $arr = @(); $sum = 0

    do {
        $n = Read-Host "Geben Sie den Anzahl der Messwerte ein! - Programmende -1 oder 0"
        if ($n -match "^[1-9]{1}\d*$") {
            $n = [int]$n
            $mimph = $true
        }
        elseif ($n -match "^-1$|^0+$") {
            Write-Host "Auf Wiedersehen!"
            $egg = $false
            break
        }
        else {
            Write-Host "Bitte vernünftigen Input eingeben!"
        }
    } until ($mimph)

    if ($mimph) {

        for ($i=$n; $i -gt 0; $i--) {
            $guh = $true
            do {
                $put = Read-Host "Bitte Messwert eingeben"
                if ($put -match "^\d+$") {
                    $put = [int]$put
                    $arr += $put
                    $guh = $false
                }
                else {
                    Write-Host "Bitte nur ganze Zahlen eingeben ohne Vorzeichen!"
                }
            } while ($guh)
        }

        $lenno = $arr.Length - 1; $ception = $lenno

        for ($y = 0; $y -lt $lenno; $y++) {
            for ($x = 0; $x -lt $ception; $x++) {
                if ($arr[$x] -gt $arr[$x+1]) {
                    $tmp = $arr[$x]
                    $arr[$x] = $arr[$x+1]
                    $arr[$x+1] = $tmp
                }
            }
            $ception-- # speeding it up
        }

        # debug
        Write-Host "Unsere sortierte Messwerte: $arr"

        # median
        $lenno = $arr.Length
        # odd numbers -> $lenno % 2 -eq 1
        if ($lenno % 2) {
            $med = $lenno/2
            $med = [int]$med
            $median = $arr[$med]
        }
        # even numbers -> $lenno % 2 -eq 0
        else {
            $med = $lenno/2
            $median = ($arr[$med] + $arr[$med+1])/2
        }
        
        # spann
        $span = $arr[$lenno-1] - $arr[0]

        # middle
        foreach ($legg in $arr) {
            $sum += $legg
        }

        $middle = $sum / $lenno

        Write-Host "Das Median ist: $median"
        Write-Host "Die Spannweite ist: $span"
        Write-Host "Der Mittelwert ist: $middle"
    }
}