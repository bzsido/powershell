$newstring = ""

do {
    # ask for input and split it to substrings at every whitespace
	$in = read-host "Schreiben Sie einen Satz oder ein Wort!"
    $spl = -split $in

    # test if it doesn't include special characters
	# numbers are sadly included
	foreach ($s in $spl) {
        if ($s -match "\w+") {
            $loop = $false
        }
        else {
            write-host "Bitte nur Woerter, Buchstaben oder Nummer eingeben!"
        }
    }
} while ($loop)

$code = Read-Host "Zum Verschlusseln schreiben Sie 'code' zum Entschluesseln 'decode'?"

if ($code -eq "code") {

    foreach ($s in $spl) {
		
		# we test here every character of every word
		# that's one of the easiest methods to do it - foreach ist not working for strings
        for ($i = 0; $i -lt $s.Length; $i++) {
            # applying different rules for A,B,C and a,b,c - the encoded characters are at the end of the alphabet
			if([int]$s[$i] -ge 65 -and [int]$s[$i] -le 67 -or
               [int]$s[$i] -ge 97 -and [int]$s[$i] -le 99) {
                $s_o = [int]$s[$i] + 23
            }
            # rebuilding string
			else {
                $s_o = [int]$s[$i] - 3
            }
            $newstring += [char]$s_o
        }
        $newstring += " "
    }
    Write-Host "Der verschluesselte Output ist:"
    Write-Host $newstring
}

elseif ($code -eq "decode") {

    foreach ($s in $spl) {
		
		# we test here every character of every word
		# that's one of the easiest methods to do it - foreach ist not working for strings
        for ($i = 0; $i -lt $s.Length; $i++) {
            # applying different rules for X,Y,Z and x,y,z - the decoded characters are at the beginning of the alphabet
			if([int]$s[$i] -ge 88 -and [int]$s[$i] -le 90 -or
               [int]$s[$i] -ge 120 -and [int]$s[$i] -le 122) {
                $s_o = [int]$s[$i] - 23
            }
            # rebuilding string
			else {
                $s_o = [int]$s[$i] + 3
            }
            $newstring += [char]$s_o
        }
        $newstring += " "
    }
    Write-Host "Der entschluesselte Output ist:"
    Write-Host $newstring
}