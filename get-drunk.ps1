function get-drunk {

    [Cmdletbinding()]

    param([parameter(Mandatory=$true,
                     Helpmessage="Define how many bottles of free alcohol do you provide")]
                     [ValidateNotNullOrEmpty()]
                     [int]$free_alcohol)

    $common_sense = Get-Random -min 1 -max 15
    write-verbose "Common Sense: $common_sense"
    $drunkasfuck=0

    do {
        $free_alcohol--
        $drunkasfuck++
        "$free_alcohol bottles of free alcohol left"
        "Drunkness level: $drunkasfuck"
        write-verbose "Drunk as fuck * Common Sense: $($drunkasfuck*$common_sense)"
    } until ($free_alcohol -le 0 -OR $drunkasfuck*$common_sense -gt 100)

}