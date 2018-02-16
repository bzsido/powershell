cls
# count
$i=1

# regex
$regex="^0*(100){1}$|^0*[1-9]{1}\d?$"
$zero="^0+$"

write-host "Gueltige Werte fuer die Anzahl <n>: 1,..., 100 oder 0 fuer Programmende"

# starting while-loop

while (1) {

	# prompt user-input
	$input=read-host "Bitte geben Sie die Anzahl <n> ein ($i. Versuch)"

	if ($input -match $regex) {
		
		# defining & emptying variables
		$y=1
		$x=0
		$erg=0
		$output=@(0, 1)
		
		# converting user-input to integer
		$until=[int]$input
		
		# ze fibonacci loop
		for ($index=1; $index -le $until-2; $index++) {
			$erg=$x+$y
			$output+=$erg
			$x=$y
			$y=$erg				
		}
		
		# output
		write-host "Die ersten $until Fibonacci Zahlen lauten:"
		$output
		write-host "Geben Sie einen neuen Zahl ein, oder druecken Sie 0 fuer Programmende"
		
	}
	
	# exit if 0 is entered
	elseif ($input -match $zero) {
		write-host "Einen schoenen Tag noch!"
		exit
	}
	
	# otherwise annoy the user
	else {
		write-host "Bitte gueltigen Input eingeben!"
	}
	$i++
}

