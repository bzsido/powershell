Try {

	[int32]$a=read-host "Please enter the first integer";
	[int32]$b=read-host "Please enter the second integer";

	$c=$a/$b;

	write-host "The result is: "$c;

} 

Catch {

	write-host "Error, please only enter 32 bit integers! Don't use + or 0 in the beginning.";

}
