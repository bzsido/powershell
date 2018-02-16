<#function Drives {

$hash = @{}
$i= Get-WmiObject -Class win32_logicaldisk
$hash["Device"]=$i
$hash["Space"]=$i
$object = New-Object -TypeName PsObject -Property $hash
$object



}#>

#Get-WmiObject -Class win32_logicaldisk | Select-Object -Property @{Label="Fixed"; Expression= {0:N0} -f DeviceID}

Get-CimInstance -ClassName Win32_logicaldisk | Select-Object @{Label="Device ID"; Expression={"{0}" -f $_.DeviceID}}, @{Label="Drivetype"; Expression={switch($_.Drivetype){2 {"Floppy"} 3 {"Fixed"} 4 {"Network"} 5 {"Optical"} default {"..."}}}}, @{Label= "Size"; Expression={"{0:N2}GB" -f (($_.size)/1GB)}}, @{Label= "FreeSpace"; Expression={"{0:N2}GB" -f (($_.FreeSpace)/1GB)}}

#It is a fucking One liner!!!!!!!!!! YEAH !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!