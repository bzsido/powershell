$erg=0
$regex="^0*[1-9]+\d*$"

while (1) {

	$input=read-host "Bitte geben Sie eine ganze Zahl verschieden von 0 ein!"

	if ($input -match $regex) {

		$n=[int]$input
		
		for ($i=1; $i -lt $n; $i++) {
			$math=$n*($n-$i)
			write-host "Math:", $math
			$erg+=$math
			write-host "Ergebnis:", $erg
		}
		break
	}

	else {
		write-host "Bitte geben Sie eine gueltige Zahl ein!"
	}

}

write-host "Das Ergebnis fuer den Zahl $n ist $erg"