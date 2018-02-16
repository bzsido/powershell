function get-time {
param ([parameter(ValueFromPipeline=$true)][string]$servername)
begin{}

process{
# hash-table definieren
$ergebnis=@{}

# wenn der Computer angeschaltet ist fragt die uptime ab
# test-connection: ping
# -erroraction silentlycontinue: die fehlermeldungen werden damit unterdrückt
if(Test-Connection -ComputerName $servername -Count 1 -ErrorAction SilentlyContinue){

    # ermittelt den uptime
    # gwmi: get-wmiobject
    $wmi = gwmi -Class win32_operatingsystem -Computer $servername
        $LBTime = $wmi.ConvertToDateTime($wmi.Lastbootuptime)
        # differenz zwischen reboot und heute
        [Timespan]$uptime = New-TimeSpan $LBTime $(get-date)
    $ergebnis["uptime"] = $uptime

}
# wenn der Computer nicht an ist
else {
    $ergebnis["uptime"]=-1
}
$ergebnis
}

end{}
}