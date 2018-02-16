function get-device {

[Cmdletbinding()]

param()

begin {}

process {
$disks = @()
$logicaldisks = Get-CimInstance -ClassName win32_logicaldisk

    foreach ($logicaldisk in $logicaldisks) {

        switch($logicaldisk.drivetype){
            2{$drivetype="Floppy";break}
            3{$drivetype="Fixed";break}
            4{$drivetype="Network";break}
            5{$drivetype="Optical";break}
         }

         Write-Verbose "Drivetype: $drivetype"

        $ergebnis=@{}
        $ergebnis["DeviceID"]=$logicaldisk.deviceid
        $ergebnis["Drivetype"]=$drivetype
        $ergebnis["Size"]=$logicaldisk.size
        $ergebnis["Freespace"]=$logicaldisk.freespace
        $obj=New-Object -TypeName psobject -Property $ergebnis
        $disks+=$obj
    }
    $disks
}

end {}

}

get-device -Verbose