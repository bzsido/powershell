# first ask for input and check if it's an integer with max. 4 digits

$regex="^\d{1,4}$"

# starting the while loop for user-input

while (1) {

	# prompt the user for input

	$input=read-host "Please enter the desired year";

	#check if the input is valid, and only then enter the program

	if ($input -match $regex) {

		# converting the input to integers
		
		$J=[int]$input
				
		# applying the formulas (already known)
		
		$d=[int](((15+$J/100-$J/400-(8*$J/100+13)/25)%30+19*($J%19))%30)
				
			if ($d -eq 29) {
				$D=28
				# echo "e1"
			}
			
			elseif ($d -eq 28 -AND $J%17 -ge 11) {
				$D=27
				# echo "e2"
			}
			
			else {
				$D=$d
				# echo "e3"
			}

        $e=[int]((2*($J%4)+4*($J%7)+6*$D+(6+$J/100-$J/400-2)%7)%7)
				
		$day=($e+$D+1)
		
		write-host "In the year", $J "Easter begins", $day "days after the 21st March."
		
		# calculate the exact date
		
			if ($day -le 10) {
			
				$march=$day+21
				write-host "In the year", $J "Easter begins on", $march "March."
			
			}
				
			elseif ($day -gt 10 -AND $day -le 40) {
			
				$april=$day+21-31
				write-host "In the year", $J "Easter begins on", $april "April."
			
			}
			
			else {
			
				$may=$day+21-61
				write-host "In the year", $J "Easter begins on", $may "May."
			
			}

		break
	}

	else {
		
		write-host "Error, please enter an integer with max. 4 digits!"
	}
}