cls

# true variables and arrays
$egg = $true; $gleich = $true
$arr = @(); $rev = @()

# prompting
do {
    $n = Read-Host "Bitte einen ganzen Zahl eingeben (ohne Vorzeichen, mind. 2, max. 9 Ziffern)"
    if ($n -match "^\d{2,9}$") {
        $n = [int]$n
        $egg = $false
    }
    else {
        Write-Host "Bitte vernünftigen Input eingeben!"
    }
} while ($egg)

$orig = $n

# cutting up the number and adding the digits to an array
while ($n) {
    $arr += $n % 10
    $n = [Math]::Truncate($n / 10)
}

$lenno = $arr.Length

# reversing array manually
for ($i=$lenno - 1; $i -ge 0; $i--) {
    $rev += $arr[$i]
}

# comparing arrays
for ($y = 0; $y -lt $lenno; $y++) {
    if ($arr[$y] -ne $rev[$y]) {
        $gleich = $false
        Write-Host "$orig ist kein Palindrom" -ForegroundColor Red
        Write-Host "$arr ist nicht gleich $rev" -ForegroundColor Red
        break
    }
}

if ($gleich) {
    Write-Host "$orig ist ein Palindrom" -ForegroundColor Cyan
    Write-Host "$arr ist gleich $rev" -ForegroundColor Cyan
}