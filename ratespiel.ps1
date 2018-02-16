cls

# input filter?
# $regex=""

while (1) {

	# generate random integer
	# the range is including the min, but not the max value (up to 91)
	$a=get-random -min 1 -max 91
	# define variable/set to zero
	$count=0
	
	while (1) {
	
		# user input
		$input=read-host "Bitte geben Sie eine Zahl zwischen 1 und 90 ein!"
		$b=[int]$input
		$count++
		
		if ($b -gt $a) {
			write-host "Ihre Eingabe ist groesser als die generierte Zahl"
		}
			
		elseif ($b -lt $a) {
			write-host "Ihre Eingabe ist kleiner als die generierte Zahl"
		}
		
		
		else {
			write-host "Sie haben gewonnen, die generierte Zahl ist:", $b
				
				# switch statement
				switch($count) {
					{ $_ -lt 3} { "Super!"; break }
					{ $_ -ge 3 -AND $_ -lt 5} { "Sehr gut"; break }
					5			{ "Gute Leistung"; break }
					{ $_ -gt 5 -AND $_ -le 8} { "Mittelmaessige Leistung"; break }
					default		{"Schwache Leistung"; break}
				}
						
				$spiel=read-host "Druecken Sie 1 fuer eine neue Runde oder 0 fuer Spielende"
				$s=[int]$spiel
				
				if ($s -eq 1) {
					cls
					break
				}
				
				elseif ($s -eq 0) {
					write-host "Einen schoenen Tag noch!"
					exit
				}
			}
	}
}