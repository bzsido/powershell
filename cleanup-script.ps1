# you have to work with lastwritetime, since creationtime will be
# the date you copied the files on your computer

# ls -r | where-object {$_.name -like "*.jpg" -OR `
#                    $_.name -like "*.png" -OR `
#                    $_.Name -like "*.gif"} | `
#Sort-Object -Property lastwritetime | `
#Select-Object -Property lastwritetime, length, name | `
#"{0:Y}" -f [DateTime] (Get-ItemPropertyValue .\20161223_231133.jpg lastwritetime)

$dir=Read-Host "Please Enter the directory where you want to sort your pictures!"

$a=ls $dir | where-object {$_.name -like "*.jpg" -OR `
                    $_.name -like "*.png" -OR `
                    $_.Name -like "*.gif"}

# we save the results in an extra variable, since
# if we start to read out properties, it's very likely
# that our output will lose it's object attributes.
# we still need to work with the original files later!

$orig=$a

"Variable Inhalt nach For-Schleife:"; $a

$hash=@{}

# the year month {0:Y} -f [DateTime] formatting is a standard .Net formatting
# more details on PowerShell Cookbook page 779

foreach ($elem in $a) {

    #$hash["lastwritetime"] = "{0:Y}" -f [DateTime] (Select-Object -property lastwritetime)
    #$hash["directory"] = Select-Object -Property directory
    #$hash["name"] = Select-Object -Property name
    
    "-------------------------------------------------"
    $elem
    "{0:Y}" -f [DateTime] (Get-ItemPropertyValue $elem lastwritetime)
}

$boj = New-Object -TypeName psobject -Property $hash

"Hash"; $hash
"Object:"; $boj

# the output here is a string
# we either convert it ToDateTime or we have to work with Regex...

# or we can convert the results right away to a hash table 

# group files per year and month
# create a folder for each existing month per year
# copy/cut and paste the files in the created folders

# you can also do that for every file-type eg. pictures, binaries, movies, docs, etc.