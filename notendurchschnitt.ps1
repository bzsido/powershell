# clearing terminal, defining variables
cls
$regex="^\d{1,2}$"
[int]$index=0
[int]$sum=0
$arr=@{"sehr gut"=1; "gut"=2; "befriedigend"=3; "ausreichend"=4; "mangelhaft"=5; "ungenuegend"=6}

# start a foreach loop for each element of the hash table
foreach ($key in $($arr.keys)) {

$input=read-host "Bitte geben Sie die Anzahl der Noten '$key' an"

	# filtering user input
	if ($input -match $regex) {	
		
		# converting input to int
		$number=[int]$input
		# setting an index to measure maximum value
		$index+=$number
		
		# checking maximum value
		if ($index -le 40) {
			# adding up values to calculate the average value at the end
			$sum+=$arr.$key*$number
			# setting the actual amount of the certain note
			$arr.Set_Item($key, $number)
			# testing
			# write-host "Summe" $sum
			
		}
		
		# if the sum becomes higher than 40 exiting the program 
		else {
			write-host "Ungueltige Eingabe. Bitte geben Sie nur Zahlen ein, deren Summe maximal 40 ist!"
			exit
		}
	
	}
	
	# in case the input cannot be converted to int exiting the program
	else {	
		write-host "Ungueltige Eingabe. Bitte geben Sie nur Zahlen ein, deren Summe maximal 40 ist!"
		exit
	}

}

# printing the table and the average note
$arr.GetEnumerator()
[int]$average=$sum/$index
write-host "Notendurchschnitt", $average