do {
$start=read-host "Start? Press any character or 0 to quit."
	
	if ($start -ne 0) {

		$a=get-random -min 1 -max 11
		switch($a) {
			{ $_ -lt 3} { "Super!"; break }
			{ $_ -ge 3 -AND $_ -lt 5} { "Sehr gut"; break }
			5			{ "Gute Leistung"; break }
			{ $_ -gt 5 -AND $_ -le 8} { "Mittelmaessige Leistung"; break }
			default		{"Schwache Leistung"; break}
		}
	}	
} while ($start -ne 0)