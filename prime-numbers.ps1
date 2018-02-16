function print-prime {

[cmdletbinding()]

# here I'm not filtering for the correct input, a number less than 3 could break the function
param([parameter(Mandatory=$true,HelpMessage="Please enter a number greater than 3")][int]$i)

begin {
    $arr = @()
    $prime = @(2)
    $range = 3..$i
}

process {
    foreach ($num in $range) {
        $j = $num-1
        $arr += $j
        $is_prime = 1

        # checking if current number can be divided with all numbers between 2 and current number - 1
        foreach ($elem in $arr) {
            if ($num % $elem -eq 0) {
                # either only print the variable, or write the whole output in a string
                Write-Verbose "$num can be divided with $elem"
                $is_prime = 0
                break
            }
        }
        # checking after the for loop to avoid adding numbers dividable by 2
        if ($is_prime -ne 0) {
                $prime+=$num
                # either only print the variable, or write the whole output in a string
                Write-Verbose "added: $num"
        }
    }
}

end {
    Write-Output "Prime numbers between 2 and $i" $prime
}
}
