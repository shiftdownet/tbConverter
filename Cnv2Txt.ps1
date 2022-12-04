
param([String]$Path, [String]$Destination="./bin.txt", [Int]$Key=0)

if ( ($null, "").Contains($Path) -Or !(Test-Path $Path) ) { throw "Path is not specified." }
if ( ($null, "").Contains($Destination) ) { throw "Destination is not specified." }

( Get-Content $Path -Encoding Byte ) | % { $_ -bxor $Key } | % { $_.ToString("X2") } | Out-File $Destination -NoNewline
