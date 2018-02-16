function create-user {

[cmdletbinding()]
Param([parameter(Mandatory=$true)][string]$pfad)

begin {
    # Faule Loesung
    #$pfad="D:\ownCloud\RWTH Ausbildung\powershell\benutzerkonten.csv"

    $imp_users = import-csv -Path $pfad
    $count = 0
}

process {
    foreach ($imp in $imp_users) {

        # Benutzerdaten zusammenbasteln
        $konto = $imp_users[$count].Vorname+" "+$imp_users[$count].Nachname
        $login = "074"+$imp_users[$count].Nachname+"."+$imp_users[$count].Vorname
        $besch = $imp_users[$count].Beschreibung
        $passwort = $imp_users[$count].Geburtsdatum | ConvertTo-SecureString -AsPlainText -Force
        $count++

        # "Verbose"
        #Write-Verbose $count, $konto, $login, $besch
    
        # testen mit WhatIf
        New-LocalUser -AccountNeverExpires -Name $login -Password $passwort -FullName $konto -Description $besch -WhatIf
    }
}

end {}

}

# hat als normaler script funktioniert, aber jetzt habe ich probleme mit write-verbose
# ich kann es auch nicht in normalen Powershell importieren
# charakterersatz noch implementieren!!!!
# https://gallery.technet.microsoft.com/scriptcenter/PowerShell-Create-Active-7e6a3978
