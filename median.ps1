$arr = @()
$loop = $true

# user-input filtering
do {

    $read = Read-Host "Wie viele Zahlen wollen Sie einlesen lassen? Negative Zahl eingeben fuer Programmende."
    
    # controlling if the required amount is a whole number between 1 and 10
    if ($read -match "\d+" -and [int]$read -ge 1 -and [int]$read -le 10) {
        for ($i = 1; $i -le [int]$read; $i++) {
            $add = Read-Host "Geben Sie den naechsten Nummer ein!"
            # controlling if the entered number is a whole +/- number
            if ($add -match "-?\d+") {
                $arr += $add
            }
            else {
                Write-Host "Bitte geben Sie nur ganze Zahlen ein!"
            }
        }
        $loop = $false
    }
    
    # exiting if the user enters a negative number
    elseif ($read -match "-{1}\d+") {
        Write-Host "Program wird beendet. Tschuess!"
        Sleep 1
        Exit 
    }

    else {
        Write-Host "Geben Sie einen Anzahl zwischen 1 und 10 ein!"
    }

} while ($loop)

Write-Host "Unsortiert:", $arr

# bubble-sorting the array
do {
    $switch = $false
    for ($i = 1; $i -lt $arr.Length; $i++) {
        if ([int]$arr[$i - 1] -gt [int]$arr[$i]) {
            [int]$arr[$i - 1], [int]$arr[$i] = [int]$arr[$i], [int]$arr[$i - 1]
            $switch = $true
        }
    }
} while ($switch)

Write-Host "Sortiert:", $arr

# calculating range
$len = $arr.Length
$last = $len - 1
$range = $arr[$last] - $arr[0]

# calculating average
foreach ($a in $arr) {
    $erg += $a
}

$aver = $erg / $len

# deciding the method to calculate the median

# odd case
if ($len % 2 -ne 0) {
    # the median is the middle element
    $med = ($len - 1) / 2
    $out = $arr[$med]
}

# even case
else {
    # the median is the average of the two middle elements
    $med = $len / 2
    $out = ($arr[$med] + $arr[$med - 1])/2
}

Write-Host "Die Spannweite ist $range"
Write-Host "Der Mittelwert ist $aver"
Write-Host "Der Median ist $out"