cls

# variables for user prompting
$egg1 = $true; $egg2 = $true; $egg3 = $true
# arrays
$rev1 = @(); $rev2 = @(); $ergb = @()
# variables for saving decimals
$dec1 = 0; $dec2 = 0
# correcting a mistake
[string]$savezeros = 1

# prompting the user for numbers and operation
do {
    $z1 = Read-Host "Bitte geben Sie den ersten Dualzahl ein! (8 Ziffern)"
    if ($z1 -match "^[0-1]{8}$") {
        # a leading one is added to our input [string]
        # in case we have leading zeros they won't be deleted
        $z1 = $savezeros + $z1
        Write-Host "Der erste Zahl ist (1 am Anfang): $z1" -ForegroundColor Cyan
        $z1 = [int]$z1
        $egg1 = $false
    }
} while ($egg1)

do {
    $z2 = Read-Host "Bitte geben Sie den zweiten Dualzahl ein! (8 Ziffern)"
    if ($z2 -match "^[0-1]{8}$") {
        # a leading one is added to our input [string]
        # in case we have leading zeros they won't be deleted
        $z2 = $savezeros + $z2
        Write-Host "Der zweite Zahl ist (1 am Anfang): $z2" -ForegroundColor Cyan
        $z2 = [int]$z2
        $egg2 = $false
    }
} while ($egg2)

do {
    $op = Read-Host "Bitte geben Sie die Operation ein! (+,-,*,/)"
    if ($op -match "^\+|-|\*|\/$") {
        $egg3 = $false
    }
} while ($egg3)

#debug / output
Write-Host "Zahl1 ist $z1"
Write-Host "Zahl2 ist $z2"
Write-Host "Sie haben die Operation ist $op gewählt"

# converting numbers to arrays
<# 
Notes:
- we save the numbers backwards, so we can count upwards in the next loop
- we use a for loop to get our 8 numbers out (although our numbers consist of 9 digits)
- remember, we added a leading one to prevent powershell deleting our leading zeros
- we won't add this leading one to our array
#>

for ($i=0; $i -le 7; $i++) {
    $rev1 += $z1 % 10
    $z1 = [Math]::Truncate($z1/10)
    $rev2 += $z2 % 10
    $z2 = [Math]::Truncate($z2/10)
}

#debug
Write-Host "Array 1 ist $rev1"
Write-Host "Array 2 ist $rev2"

# converting to decimal
for ($j = 0; $j -le 7; $j++) {
    $two = [Math]::Pow(2,$j)
    #Write-Host "Zwei ist jetzt $two" -ForegroundColor Cyan
    #Write-Host "Dualzahl 1:"; $rev1[$j]
    $dec1 += $rev1[$j] * $two
    #Write-Host "Dezimal 1 ist $dec1" -ForegroundColor Cyan
    $dec2 += $rev2[$j] * $two
    #Write-Host "Zahl1:"; $rev2[$j]
    #Write-Host "Dezimal 2 ist $dec2" -ForegroundColor Cyan
}

#debug
Write-Host "Dezimalzahl 1: $dec1"
Write-Host "Dezimalzahl 2: $dec2"

# doing the operation in the decimal system
# switch statements are useful when you have a lot of cases
switch -Regex ($op) {
    "^\+$" {$ergd = $dec1 + $dec2}
    "^-$" {$ergd = $dec1 - $dec2; if ($dec1 -lt $dec2){$ergd = $ergd * -1}}
    "^\*$" {$ergd = $dec1 * $dec2}
    "^\/$" {$ergd = $dec1 / $dec2; $ergd = [Math]::Truncate($ergd)}
    default {"Error! Irgendwas ist schief gelaufen."}
}

# converting back to binary
$tobin = $ergd
while ($tobin) {
    $ergb += $tobin % 2
    $tobin = [Math]::Truncate($tobin/2)
}

# reversing everything for output
[Array]::Reverse($ergb)
[Array]::Reverse($rev1)
[Array]::Reverse($rev2)

# output
Write-Host "Ihre erste Dualzahl war: $rev1"
Write-Host "In Dezimal ist es $dec1"
Write-Host "Ihre zweite Dualzahl war: $rev2"
Write-Host "In Dezimal ist es $dec2"

if ($dec1 -lt $dec2) {
    Write-Host "Das Ergebnis ist: - $ergb"
    Write-Host "In dezimal ist es - $ergd"
}

else {
    Write-Host "Das Ergebnis ist: $ergb"
    Write-Host "In dezimal ist es $ergd"
}