#import csv stig registry data, create and set corresponding values
Import-Csv -Path .\win10-stig-registry.csv | ForEach {
   If (!(Test-Path $_.RegPath)) {
    New-Item -path $_.RegPath -force | out-null
    }

    New-ItemProperty -path $_.RegPath -name $_.ValueName -value $_.Value -PropertyType $_.PropType -force
} 
