$regex = "^[\d]{1,6}$"
$count = 0
$run = 1

while ($run -eq 1) {
	$in = read-host "Bitte geben Sie eine Nummer ein mit 1-6 Ziffern!"
	
	if ($in -match $regex) {
		$run = 0
		$in = [int]$in
		$orig = $in
		
		while ($in -gt 0) {
		
			if ($in % 5 -eq 0) {
			
				if ($in % 10 -ne 0) {
					$count++
					$in/=10
					$in=[math]::truncate($in)
				}
				else {
					$in/=10
					$in=[math]::truncate($in)
				}
			}
			
			else {
				$in/=10
				$in=[math]::truncate($in)
			}
		}
	
		write-host "Die Zahl $orig enthaelt $count mal die Ziffer 5"	
	}
	
	else {
		write-host "Bitte geben Sie eine Zahl mit 1-6 Ziffern ein! Nur Ziffer sind erlaubt!"
	}
}