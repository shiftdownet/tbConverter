
param([String]$Path, [String]$Destination="./txt.bin",$Key=0)

if ( ($null, "").Contains($Path) -Or !(Test-Path $Path) ) { throw "Path is not specified." }
if ( ($null, "").Contains($Destination) ) { throw "Destination is not specified." }

[String]$hold = ""
[byte[]]$outputBytes = @()

(Get-Content $Path -Raw).ToCharArray() | % {
    if($hold -eq "")
    {
        $hold = $_
    }
    else
    {
        $outputBytes += ( [convert]::ToInt32( $hold + $_, 16) ) -bxor $Key
        $hold = ""
    }
}

[System.IO.File]::WriteAllBytes($Destination, $outputBytes);
