cls
$arr=@()
$sw_count=0
$count=0

# defining the number of elements to add (min. 5, max. 20)
$n=get-random -minimum 5 -maximum 20
write-host "Der Array erhaelt $n elemente."

# generating $n random integers (between 1 and 200) and adding them to the array
for ($i=1; $i -le $n; $i++) {
	$elem=get-random -minimum 1 -maximum 200
	$arr+=$elem
}

# printing the array and saving it's lenght in a variable
write-host "Array:"
write-host $arr
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
			$sw_count+=1
		}
	}
	
	$count+=1
	write-host "Zwischenergebnis {$count}:"
	write-host $arr

# only enter the loop if more switch operations are necessary ($switch=1)	
} while ($switch -eq 1)

# printing the results
write-host "Sortiert:"
write-host $arr

write-host "Tauschoperationen:"
write-host $sw_count
