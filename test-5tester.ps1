# 5-tester Skript aus dem ersten Klassenarbeit

$regex="^\d{1,6}$"
$found=0

while (1) {

    $input=read-host "Bitte geben Sie eine positive ganze Zahl mit max. 6 Ziffern ein!"

    if ($input -match $regex) {
        
        # die länge vom Input ermitteln und nachher in Integer konvertieren
        $len=$input.Length
        $input=[int]$input
        # originalen Wert vom Input abspeichern
        $orig=$input

        while ($input -gt 0) {
        
            if ($input % 5 -eq 0 -and`
                $input % 10 -ne 0) {
                
                Write-Host "Wir haben einen 5 gefunden!"
                $input=$input/10
                $input=[Math]::Truncate($input)
                echo $input
                $found++
            }

            else {
                Write-Host "Wir haben keinen 5 gefunden!"
                $input=$input/10
                $input=[Math]::Truncate($input)
                echo $input
            }

        }
        
        Write-Host "In der Zahl $orig ist der Ziffer 5 $found mal erhalten."
        exit

    }
}