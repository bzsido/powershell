# this is a lame script for sorting out non-prime numbers
# for any n number

[int]$n=read-host "Enter number"

# you need the numbers before 10
$range=1..$n
$orig=$range
$divide=2, 3, 5, 7

# sorting the numbers to divide with

foreach ($number in $divide) {
	foreach ($elem in $range) {
		if ($elem%$divide -eq 0 -AND $elem -gt 9) {
			$range.Remove($elem)
		}
	}
}

write-host "The cleaned array is: $range"

# now time to sort out the non-primes

foreach ($number in $orig) {
	foreach ($elem in $range) {
		if ($number%$elem -eq 0 -AND $number -ne $elem) {
			$orig.Remove($elem)
		}
	}
}

write-host "The remaining prime numbers are: $orig"

# powershell cookbook 194
# https://stackoverflow.com/questions/24754822/powershell-remove-item-0-from-an-array

	