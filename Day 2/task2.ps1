#ref: https://adventofcode.com/2021/day/2 

# PART 2 SOLUTION

[CmdletBinding()]

param (
    [Parameter(Mandatory=$true)][string]$inputfile
)

$movelist = Get-Content $inputfile

$horizontalPosition = 0 ; $downs = 0 ; $ups = 0 ; $aim = 0 ; $depth = 0

$movelist | % { 
    $direction = $_.split(' ')[0] 
    $count = $_.split(' ')[1].toInt32($null) ;

    switch ($direction) {
        'forward' {
            $forwards += $count
            $horizontalPosition += $count
            $depth += ($aim * $count)
            break
        }
        'down' {
            $downs += $count
            $aim += $count
            break
        }
        'up' {
            $ups += $count
            $aim -= $count
            break
        }
        default {
            Write-Error "Unknown direction in input file: $direction"
        }
    }
}


write-verbose ("Total of downs: $downs")
Write-Verbose ("Total of ups: $ups")
write-verbose ("Final horizontal position: $horizontalPosition")
Write-Verbose ("Final depth : $depth")
Write-Verbose ("(PART 2 ANSWER) :: Final horizontal position * final depth = " + ($horizontalPosition * $depth))
