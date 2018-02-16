# defining arrays
$x=@()
$k=@()

# filling the array with random numbers
for ($i=0; $i -le 100; $i++) {
    $x+= Get-Random -min 0 -max 3
}

$count=1
$index=1

# counting the elements of the array and 
# adding the results to the other array
foreach ($elem in $x) {
    if ($elem -eq $x[$index]) {
        $count++
    }
    else {
        $k+=$elem
        $k+=$count
        $count=1
    }
    $index++
}

# output
write-host "Urspruenglicher Array:", $x
write-host "Komprimierter Array:", $k
"Komprimierungsfaktor:", $($k.Length/$x.Length)