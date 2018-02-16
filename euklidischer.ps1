#first set the criteria to filter out non-numeric input 
#and everything greater then the max value of [int32]
#x can be 0, we will deal with that later on

$max="^0*(?=[1-9])(1|2(?=0|1(?=[0-3]|4(?=[0-6]|7(?=[0-3]|4(?=[0-7]|8(?=[0-2]|3(?=[0-5]|6(?=[0-3]|4(?=[0-7]))))))))))?\d{1,9}$"
$zero="^0+$"

#then prompt the user for input

$input_x=read-host "Please enter the counter (x)";
$input_y=read-host "Please enter the denominator (y)";

#check if the input is valid, and only then enter the program

if ($input_x -match $zero -OR $input_x -match $max -AND $input_y -match $max) {
	
	#converting the input to integers
	
	[int]$x=$input_x
	[int]$y=$input_y
	
	#saving the original values of x and y
	
	$x_orig=$x
	$y_orig=$y
	
		#if x is 0 the greatest common divisor is the number itself
		if ($x -eq 0) {
		
			$x=$y;
		}
		
		#start the while loop
		while ($x -ne $y) {
			if ($x -gt $y) {
			
				$x=$x-$y;
			}

			else {
		
			$y=$y-$x;
			}
			
			#just to see what's happening
			write-host "x=$x y=$y"
			start-sleep -m 10
		}
	
	#this is only creepy because of the formatting
	
	write-host "The greatest common divisor is:" $x;
	write-host "The original fraction was:"; write-host $x_orig; write-host "--"; write-host $y_orig 
	write-host "The simplified fraction is:"; $x_orig/$x; write-host "--"; $y_morig/$y

} 

else {

        write-host "Error, please only enter positive 32-bit integers!`r`nThe maximum value is 2147483647. Use only digits!";

}