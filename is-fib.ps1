while (1) {
	$in=read-host "Geben Sie einen positiven ganzen Zahl ein!"
	$in=[int]$in
	$i=$in
	
	if ($i -ge 0) {
		$isfib=0; $arr=0,1
		$x=0; $y=1; $erg=0
		
		for ($i -gt 0; $i--) {
			$erg=$x+$y
			$arr+=$erg
			$x=$y
			$y=$erg
		}
		
		foreach ($elem in $arr) {
			if ($in -eq $elem) {
				$isfib=1
			}
		}
		
		if ($isfib -eq 1) {
			write-host "$in ist ein Fibonacci-Zahl!"
		}
		
		else {
			write-host "$in ist kein Fibonacci-Zahl!"
		}
	}
	
	else {
		write-host "Sie haben keinen positiven ganzen Zahl eingegeben. Auf Wiedersehen!"
		exit
	}
}
