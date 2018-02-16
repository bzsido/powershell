# funktionen

function summe {
<#
.synapsis 
Diese funktion berechnet die Summe von 0 bis max-1

.example
summe(20)
Dieser Befehl berechnet die Summe von 1 bis 19
#>

param($min,$max)

$summe=0

for ($i=$min; $i -lt $max; $i++) {
    $summe+=$i
}

"Summe von ${min}..${max}:", $summe }

summe -min 0 -max 20