# das ist eine vereinfachte Variante der Ratespiel-Uebung
cls

$num=get-random -min 1 -max 91
$count=0

do {

	$rat=read-host "Bitte geben Sie einen ganzen Zahl zwischen 1 und 90 ein!"
	$count++

	if ($rat -gt $num) {
		write-host "Ihre Eingabe ist zu gross!"
	}
	
	elseif ($rat -lt $num) {
		write-host "Ihre Eingabe ist zu klein!"
	}
} while ($num -ne $rat)

write-host "Sie haben gewonnen! Anzahl Ihrer Versuche: $count"

switch ($count) {

	{$_ -lt 3} { "Super!"; break }
	{$_ -ge 3 -AND $_ -lt 5} { "Sehr gut"; break }
	5			{ "Gute Leistung"; break }
	{$_ -gt 5 -AND $_ -le 8} { "Mittelmassige Leistung"; break }
	default		{ "Schwache Leistung"; break }
}