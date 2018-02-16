$j = 1
$count = 1
$arr = @()
$compr = @()

for ($i = 10; $i -gt 0; $i--) {
    $random = get-random -max 3
    $arr += $random
}

write-host $arr

foreach ($elem in $arr) {
    if ($elem -eq $arr[$j]) {
        $count++
    }
    else {
        $compr+=$elem
        $compr+=$count
        $count=1
    }
    $j++
}

write-host "Uerspruenglicher Array:", $arr
write-host "Komprimierter Array:", $compr
Write-Host "Komprimierungsfaktor:", $($compr.Length/$arr.Length)