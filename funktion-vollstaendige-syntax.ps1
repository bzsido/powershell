# funktionen

function summe {
<#
.synapsis 
Diese funktion berechnet die Summe von 0 bis max-1

.example
summe(20)
Dieser Befehl berechnet die Summe von 1 bis 19
#>
[cmdletbinding()]
param([parameter(Parametersetname="user",helpmessage="dies ist der Minwert")][int32]$min=0,[parameter(Mandatory=$true,Parametersetname=”user”)][int32]$max)

begin {}

process{
Write-Verbose "Minimumwert: $min"
Write-Verbose "Maximumwert: $max"
$summe=0

for ($i=$min; $i -lt $max; $i++) {
    Write-Debug "Zaehler: $i Summe: $summe"
    $summe+=$i
}
}

end{
"Summe von ${min}..${max}:", $summe }
}

summe -min 0 -max 100 -Verbose