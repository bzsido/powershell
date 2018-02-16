cls
# defining numbers for verification
$pruefnr=@(9, 8, 7, 6, 5, 4, 3, 2)

# defining regex
$regex="^\d{8}$"
$zero="^0+$"

# prompting the user for input
while (1) {
	
	# defining empty arrays
	$eing=@()
	$conv=@()
	$erg=0
	
	$input=read-host "Bitte geben Sie Ihre Kundennummer ein! (z.B. 12345678)"
	
	# exit if user input is zero
	if ($input -match $zero) {
		exit
	
	}
	
	# if user input is valid, start program
	elseif ($input -match $regex) {
		
		# don't convert to integer!!!
		write-host "Ihre Angabe:" $input

		# converting the input string to a character array
		$eing = $input.toCharArray()

		foreach ($number in $eing) {
			# using the .toInt32 method to convert chars to integers, if you don't define any options, it will fail
			# with $Null you get the char's ascii value, so subtract 48 to get the right value :) 
			$num=$number.toInt32($Null) - 48
			# adding the converted integers to your array
			$conv+=$num
		}

		# saving the original array
		$save=$conv
		
		# multiply the elements $conv and $pruefnr with each other
		# and add them to $erg
		for ($i=0; $i -lt $conv.Length; $i++) {
			$multi=$conv[$i]*$pruefnr[$i]
			write-host "multi:", $multi
			[int]$erg+=$multi
			write-host "erg:", $erg
		}

		# modulo 10 and calculating final result
		[int]$modulo=$erg%10
		$res=10-$modulo
		
		# add the result to the saved converted array
		$save+=$res
		write-host "Das Ergebnis ist:", $save
		
		}

}