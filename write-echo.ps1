function write-echo {
[cmdletbinding()]
param ([parameter(Mandatory=$true, ValueFromPipeline=$true)][string]$str1,[string]$str2="zweiter parameter")

# initialisierung
begin{}

# für jedes element ausführen
process{
Write-Verbose $str1

# write-output ist besser, weil so kann der output auch auf der kommandozeile weitergeleitet
# Write-Output $str1

# so wird der ergebnis als objekt zurückgegeben
$hash=@{}
# die reihenfolge hier beeinflusst nicht den aufbau der hash-tabelle
$hash["str1"]=$str1
$hash["str2"]=$str2
$hash["ergebnis"]=$str1+$str2
$object= New-Object -TypeName psobject -Property $hash
$object 
#$str1+=$str2
#$str1
}

#aufräumen
end{}
}

# get-help write-echo -detailed