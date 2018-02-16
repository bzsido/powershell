Get-CimInstance -ClassName win32_logicaldisk | Select-Object deviceid, @{Label="Drivetype"; Expression={switch($_.drivetype){
                                                                                                         2{"Floppy";break}`
                                                                                                         3{"Fixed";break}`
                                                                                                         4{"Network";break}`
                                                                                                         5{"Optical";break}`
                                                                                                         default{"..."}`
                                                                                                         }}},`
                                                                       @{Label="Size"; Expression={"{0:N0}" -f $_.Size}},`
                                                                       @{Label="Freespace"; Expression={"{0:N0}" -f $_.FreeSpace}}