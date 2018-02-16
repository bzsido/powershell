#creates variables and asks for input
[int]$J, $e, $D, $d;
cls;
$J =Read-Host "Jahr:";

#Sets up $date with type [DateTime]
$date=Get-Date -Date "21.03.$J";

#does the math stuff
[int]$d=((15+$J/100 -$J/400 - (8 * $J/100+13) / 25) % 30+19* ($J % 19)) % 30 ;
write-host "d:", $d
#$d.Get-Type()

#switch to check for the 3 possible values for $d
switch ($d)
{
    29 
    {
       $D=28;
	   echo "e1"
    }

    28 
    {
       if((J % 17) -ge 11) 
       {
           $D=27;
		   echo "e2"
       }   
    }

    default
    {
       $D=$d;
		echo "e3"
    }
}

#again math stuff
[int]$e = (2* ($J % 4) + 4* ($J % 7) + 6 * $D +(6+ $J /100 - $J/400 -2) % 7) % 7;
write-host "D:", $D
#$D.Get-Type()
write-host "e:", $e
#$e.Get-Type()

#adds the calculated days to the start date
$date=$date.AddDays(($e + $D +1));
#converts $date to String and changes its look to german view of Date
$date=$date.ToString("dd.MM.yyyy");
echo "Ostersonntag fällt auf den $date";