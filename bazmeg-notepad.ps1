function bazmeg-notepad {

[cmdletbinding()]
param(
	[parameter(Mandatory=$true,Helpmessage="How many bazmeg?")][int]$bazmeg,
	[parameter(Mandatory=$true, Helpmessage="How many notepads?")][int]$pad
	)

# saving the value of pad
$save = $pad

for ($bazmeg; $bazmeg -gt 0; $bazmeg--) {
    $pad = $save
    $measure = Measure-Command -expression {
     for ($pad; $pad -gt 0; $pad--) {
		notepad.exe
    }
    }
	sleep -s 1
	$proc = Get-CimInstance -ClassName Win32_Processor | select-object -property LoadPercentage
    # $ram = Get-CimInstance -ClassName Win32_PhysicalMemory | select-object -Property Capacity
    Get-process | ? {$_.ProcessName -eq  "notepad"} | % { $_.kill() }
    Write-Host "round $bazmeg"
    Write-Host $measure
    Write-Host $proc
    # Write-Host $ram
    }

}