cls
$arr=@()
[int]$count=0
[int]$low=0

# regex to filter max integer value
$regex="^0*(?=[1-9])(1|2(?=0|1(?=[0-3]|4(?=[0-6]|7(?=[0-3]|4(?=[0-7]|8(?=[0-2]|3(?=[0-5]|6(?=[0-3]|4(?=[0-7]))))))))))?\d{1,9}$"
$zero="^0+$"

# generate elements of the array with range operator (10 instead of 100)
1..10 | foreach {
	$elem=get-random -maximum 200
	$arr+=$elem
}

$len=$arr.Length

# try to do the switch operation one time
do {
	$switch=0
	for ($j=0; $j -lt $len-1; $j++) {
		
		# only switch if a preceding variable is gt than the next one
		# declare $switch variable true
		if ($arr[$j] -gt $arr[$j+1]) {
			# switching the variables
			$arr[$j], $arr[$j+1] = $arr[$j+1], $arr[$j]
			$switch=1
		}
	}

# only enter the loop if more switch operations are necessary ($switch=1)	
} while ($switch -eq 1)

# printing the results
write-host "Das generierte Array ist:"
write-host $arr

# prompting the user for input
while (1) {

	$input=read-host "Bitte geben Sie den gesuchten Wert ein"

	if ($input -match $regex -or $input -match $zero) {
	$num=[int]$input
	write-host "Ihre Angabe:" $num
	break
	}
}

# starting the search
while ($low -le $len) {

# defining the middle element
$middle_index=($low+$len)/2
# use truncate to get an integer value
$middle_index=[Math]::Truncate($middle_index)
write-host "Middle-index:", $middle_index
# define the element in the middle
$middle=$arr[$middle_index]
write-host "Middle Wert:" $middle

	if ($num -lt $middle) {
		
		$len=$middle_index-1
		$count++
		write-host "fall 1"
		write-host $count
	
	}

	elseif ($num -gt $middle) {
	
		$low=$middle_index+1
		$count++
		write-host "fall 2"
		write-host $count

	}

	else {
	
		$count=$count+1
		write-host "Die Zahl $num ist im Array an Position $middle_index zu finden."
		write-host "Es wurden $count Vergleiche benoetigt."
		[int]$found=1
		Break
	}
}

if ($found -ne 1) {

	write-host "Die Zahl ist nicht im Array zu finden."
	write-host "Es wurden $count Vergleiche benoetigt"
}
