<# 
Wir wollen mit dem folgenden Code die zu dem svchost Prozess gehörende
Services ermitteln. Wir wollen die Folgende Properties in einer Tabelle
auflisten:
processid, startmode, state, servicename, pathname, pagefaults, committedmemory
#>

# Anstatt Get-Process - alle Prozesse die in dem Namen svchost haben
$svch = Get-CimInstance -ClassName Win32_Process | ? {$_.name -like "*svchost*"}

$svch

# Leere Hash-Table als Zwischenspeicher
# und leeres Array für die Tabelle
$table=@{}
$erg=@()

foreach ($elem in $svch) {
     # Anstatt Get-Service
     $a = Get-CimInstance -ClassName win32_service | Where-Object {$_.ProcessId -eq $elem.processid}
     # Einzelne "Spalten" mit Information auffüllen
     # Wir benuzten $elem für die Properties, die von Get-Service nicht ausgegeben werden
     $table["processid"]=$elem.processid
     $table["startmode"]=$a.StartMode
     $table["state"]=$a.Started
     $table["name"]=$a.Name
     $table["pathname"]=$a.PathName
     $table["pagefaults"]=$elem.Pagefaults

     # Wir fassen die Ergebnisse in einem neuen Objekt zusammen
     $obj=New-Object -TypeName psobject -Property $table
     # Wir speichern die Elemente des Objekts in der Hash-Table ein
     $erg+=$obj
}

$erg | Format-Table
