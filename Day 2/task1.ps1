#ref: https://adventofcode.com/2021/day/2 

# PART 1 SOLUTION

[CmdletBinding()]

param (
    [Parameter(Mandatory=$true)][string]$inputfile
)

$movelist = Get-Content $inputfile

$downs = 0 ; $ups = 0 ; $depth = 0

$movelist | % { 
    $direction = $_.split(' ')[0] 
    $count = $_.split(' ')[1].toInt32($null) ;

    switch ($direction) {
        'forward' {
            $forwards += $count
            break
        }
        'down' {
            $downs += $count
            break
        }
        'up' {
            $ups += $count
            break
        }
        default {
            Write-Error "Unknown direction: $direction"
        }
    }
}


write-verbose ("total of downs: $downs")
Write-Verbose ("total of ups: $ups")
Write-Verbose ("downs - ups = " + ($downs - $ups))
write-verbose ("Final Horizontal position: $forwards")
Write-Verbose ("Final depth (downs - ups) : " + ($downs - $ups))
Write-Verbose ("(PART 1 ANSWER) :: Final horizontal position * final depth = " + ($forwards * ($downs - $ups)))