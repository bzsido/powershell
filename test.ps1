function test {

	param(
    [parameter(Mandatory=$true,
               HelpMessage="Bitte geben Sie einen positiven Zahl [int32] ein")]
    [ValidateRange(1,2147483647)]
    [int]$zahl)
	
	"Der eingegebene Zahl", $zahl

		
}