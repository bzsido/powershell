cls

# defining variables and arrays

$arr_1 = @()
$arr_2 = @()
$arr_erg = @()

$t_plus = 0
$egg = $true

# loop prompting for input

do {

$in_1 = Read-Host "Geben Sie den ersten achtstelligen Dualzahl ein!"
$in_2 = Read-Host "Geben Sie den zweiten achtstelligen Dualzahl ein!"
$in_op = Read-Host "Welche Operation wollen Sie ausführen? (+, -)"

    if ($in_1 -and $in_2 -match "^[01]{8}") {
        if ($in_op -match "^[+-]{1}") {
            $egg = $false
        }

        else {
            Write-Host "Bitte geben Sie einen validen Operator (+ oder -) ein"
        }
    }

    else {
        Write-Host "Bitte geben Sie einen validen 8-stelligen Binärzahl (nur 0 und 1) ein!"
    }

} while ($egg)

# saving length and converting input

#$lenno_1 = $in_1.Length
#$lenno_2 = $in_2.Length

$in_1 = int($in_1)
$in_2 = int($in_2)

Write-Host "Zahl 1 ist: $in_1"
Write-Host "Zahl 2 ist: $in_2"
Write-Host "Die Operation ist $in_op"

# 

do {
    $arr_1 += $in_1 % 2
    $in_1 = [Math]::Truncate($in_1 / 10)
} while ($in_1)

# not reversing arrays, cause the the indices will give you the right element the other way around

#$arr_1 = [Array]::Reverse($arr_1)

#

do {
    $arr_2 += $in_2 % 2
    $in_2 = [Math]::Truncate($in_2 / 10)
} while ($in_2)

# not reversing arrays, cause the the indices will give you the right element the other way around

#$arr_2 = [Array]::Reverse($arr_2)
# do it with a loop?

# addition
# can I do it with -eq?

if ($in_op -eq "+") {
    for ($i=0, $i -lt 8, $i++) {
        # could it be a problem it it's 3?
        $erg_plus = $arr_1[$i] + $arr_2[$i] + $t_plus
        $t_plus = 0
        
        if ($erg_plus -eq 2) {
            $erg_plus = 0
            $t_plus = 1
        }

        elseif ($erg_plus -eq 3) {
            $erg_plus = 1
            $t_plus = 1
        }
        $arr_erg += $erg_plus
    }
}

# subtraction

if ($in_op -eq "-") {
    
}

$arr_erg = [Array]::Reverse($arr_erg)