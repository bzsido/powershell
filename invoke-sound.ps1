  ##--------------------------------------------------------------------------
    ##  FUNCTION.......:  Invoke-Sound
    ##  PURPOSE........:  Beep the system speaker.
    ##  REQUIREMENTS...:  PowerShell v2
    ##  NOTES..........:  
    ##--------------------------------------------------------------------------
    Function Invoke-Sound {
        <#
        .SYNOPSIS
         Beep the system speaker.
        .DESCRIPTION
         This function gives the user a wide variety of control over the system
         speaker (and can optionally be used to play a few Windows sounds
         through the regular speakers).
        .PARAMETER Frequency
         The pitch of the beep (larger numbers is a higher pitch). Defaults to
         1000.

         ALIAS: -f
        .PARAMETER Time
         The length of the beep in miliseconds (1000 = 1 second). Defaults to
         300ms.

         ALIAS: -t
        .PARAMETER Beeps
         The number of beeps to execute (defaults to one).

         ALIAS: -b
        .PARAMETER Sub
         This optional Switch will set the Frequency to 100.

         ALIAS: -s
        .PARAMETER Low
         This optional Switch will set the Frequency to 500.

         ALIAS: -l
        .PARAMETER Medium
         This optional Switch will set the Frequency to 2000.

         ALIAS: -m
        .PARAMETER High
         This optional Switch will set the Frequency to 5000.

         ALIAS: -h
        .PARAMETER Exclamation
         This optional switch will play the "exclamation" system sound using the
         PC speakers (not the system speaker).

         ALIAS: -ex
        .PARAMETER Asterisk
         This optional switch will play the "asterisk" system sound using the
         PC speakers (not the system speaker).

         ALIAS: -as
        .PARAMETER Hand
         This optional switch will play the "hand" system sound using the PC
         speakers (not the system speaker).

         ALIAS: -ha
        .PARAMETER Vader
         Plays part of the Imperial March using the System Speaker.
        .EXAMPLE
         C:\PS>Invoke-Sound

         This Example will play a 300ms beep from the system speaker with the
         frequency set to 1000.

        .EXAMPLE
         C:\PS>Invoke-Sound 2000 5000

         This Example will play a 5 second beep from the system speaker with the
         frequency set to 2000.

        .EXAMPLE
         C:\PS>Invoke-Sound -asterisk

         This Example will play the "asterisk" system sound through the PC
         speakers (not the system speaker).

        .EXAMPLE
         C:\PS>Invoke-Sound -beeps:5

         This will play 5 beeps from the system speaker using the default
         frequency of 1000 and time of 300ms.

        .EXAMPLE
         C:\PS>Invoke-Sound -vader

         Plays a section of the Imperial March from Star Wars :)

        .NOTES
         NAME......:  Invoke-Sound
         AUTHOR....:  Joe Glessner
         LAST EDIT.:  27MAR12
         CREATED...:  12FEB10
        .LINK
         https://joeit.wordpress.com/
        #>

        Param([Parameter(Mandatory = $False,
            Position = 0)]
            [Alias('f')]
            [Int]$Frequency = 1000,
            [Parameter(Mandatory = $False,
            Position = 1)]
            [Alias('t')]
            [Int]$Time = 300,
            [Alias('b')]
            [Int]$Beeps = 1,
            [Alias('s')]
            [Switch]$Sub,
            [Alias('l')]
            [Switch]$Low,
            [Alias('m')]
            [Switch]$Medium,
            [Alias('h')]
            [Switch]$High,
            [Alias('ex')]
            [Switch]$Exclamation,
            [Alias('as')]
            [Switch]$Asterisk,
            [Alias('ha')]
            [Switch]$Hand,
            [Switch]$Vader
        )#END: Param
        If($Sub) {
            $Frequency = 100
        }#END: If($Sub)
        If($Low) {
            $Frequency = 500
        }#END: If($Low)
        IF($Medium) {
            $Frequency = 2000
        }#END: IF($Medium)
        If($High) {
            $Frequency = 5000
        }#END: If($High)
        If($Exclamation) {
            [system.media.systemsounds]::Exclamation.play()
            Break;
        }#END: If($Exclamation)
        If($Asterisk) {
            [system.media.systemsounds]::Asterisk.play()
            Break;
        }#END: If($Asterisk)
        If($Hand) {
            [system.media.systemsounds]::Hand.play()
            Break;
        }#END: If($Hand)
        If($Vader) {
            [console]::beep(392,500)
            [console]::beep(392,500)
            [console]::beep(392,500)
            [console]::beep(311,350)
            [console]::beep(466,150)
            [console]::beep(392,500)
            [console]::beep(311,350)
            [console]::beep(466,150)
            [console]::beep(392,1000)
            [console]::beep(587,500)
            [console]::beep(587,500)
            [console]::beep(587,500)
            [console]::beep(622,350)
            [console]::beep(466,150)
            [console]::beep(370,500)
            [console]::beep(311,350)
            [console]::beep(466,150)
            [console]::beep(392,1000)
        }#END: If($Vader)
        ELSE {
            1..$Beeps | %{[System.Console]::Beep($Frequency,$Time)}
        }#END: Else
    }#END: Function Invoke-Sound

    
        $tonleiter=261,293,329,349,392,440,494,523
        
        <#

        foreach ($ton in $tonleiter) {

            Invoke-Sound -f $ton
            sleep -s 1
    
        }#>

        

        $C4=261; $D4=293; $E4=329; $F4=349; $G4=392; $A4=440; $H4=494
        $C5=523; $D5=587; $E5=659; $F5=698; $G5=784; $A5=880; $H5=988
        $C6=1046;

        Invoke-Sound -f $E5; sleep -s 0.3; Invoke-Sound -f $E5; sleep -s 0.3; Invoke-Sound -f $E5; sleep -s 0.3;
        Invoke-Sound -f $C5; sleep -s 0.3;
        Invoke-Sound -f $E5; sleep -s 0.3;
        Invoke-Sound -f $G5; sleep -s 0.6;
        Invoke-Sound -f $G4; sleep -s 0.3;

        
