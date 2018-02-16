#script zur berechnung von x^n
#x aus den reellen Zahlen
#n in natürlichen Zahlen

cls
[int]$x = read-host "Bitte X angeben"
[int]$n = read-host "Bitte n angeben"
$summe = $x
[int]$i = 1

#für den [math]-operator
$a = $x
$b = $n

#für die 2te Rechnung 1/x mal 1/x ...
[int]$zähler = 1
$basis2 = $x
$hoch2 = $n
#$hochzahl = 0
$summe2 = 1

if($n -eq 0){
    "Das Ergebnis ist 1"
    break
    }
while ($i -lt $n){

    $hochzahl = $summe * $x
    $summe = $hochzahl
    $i ++
    }
"Das Ergebnis aus $x hoch $n ist $hochzahl"

#geschummelt
$g = [math]::pow($a,$b)
"Geschummelt: $g"


while ($zähler -le $hoch2){

    $hochzahl = 1 / ($basis2)
    #$hochzahl

    $summe2 = $summe2 * $hochzahl
    #$summe2

    $zähler ++
    }

$neuezahl = (1 / ($summe2))

"Mit der anderen Rechnung ergibt Die Rechnung $x hoch $n = $neuezahl"
