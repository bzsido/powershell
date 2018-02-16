$pattern_a="^[-+]?\d+$"
$pattern_b="^[-+]?(?!0)\d+$"

# negative lookahead: (?!0) defines a group, that cannot match
# if the group matches, the whole result is false

$a=read-host "Please enter the first integer";
$b=read-host "Please enter the second integer";

If ($a -match $pattern_a -AND $b -match $pattern_b) {

	$c=$a/$b;

	write-host "The result is: "$c;

} 

Else {

	write-host "Error, please only enter integers! Don't use 0 in the beginning.";

}