# powershellology

$auditing=read-host "Auditing? Yes or die!"
$money=get-random -min 111111 -max 99999999

if ($auditing) {

    do {        
        write-host "Fuck yeah, Sie haben nur noch $money Goldmuentzen"
        $money-=10000
    } until ($money -lt -100000)

    if ($money -lt 0) {    
        write-host "Congrats, Sie sind jetzt ein Tethanosaurus!"
        write-host "Status clear erreicht!"
        sleep -s 2
        clear
    }
    write-host "Oops..."
}