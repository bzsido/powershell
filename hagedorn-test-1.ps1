[int]$schueler=0
$i=1
$notenspiegel=5, 8, 10, 6, 4, 2

foreach ($anz in $notenspiegel) {

write-host "Die Note $i erreichten $anz Schueler."
$sum+=($i*$anz)
$schueler+=$anz
$i++
}

$durch=$sum/$schueler
$durch=[Math]::Truncate($durch)

write-host "Der Notendurchschnitt der Klassenarbeit ist demnach: $durch"