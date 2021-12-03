# Advent of Code 2021 - Day 3 Task 1
# https://adventofcode.com/2020/day/3


[CmdletBinding()]

param (
    [Parameter(Mandatory=$true)][string]$inputfile
)

$data = Get-Content $inputfile

$oneBitsCounter = @{
    'position0' = 0
    'position1' = 0
    'position2' = 0
    'position3' = 0
    'position4' = 0
    'position5' = 0
    'position6' = 0
    'position7' = 0
    'position8' = 0
    'position9' = 0
    'position10' = 0
    'position11' = 0
}

$zeroBitsCounter = @{
    'position0' = 0
    'position1' = 0
    'position2' = 0
    'position3' = 0
    'position4' = 0
    'position5' = 0
    'position6' = 0
    'position7' = 0
    'position8' = 0
    'position9' = 0
    'position10' = 0
    'position11' = 0
}

$data | foreach-object { 

    # Count up the number of zero and one bits in each position of the binary value string in each row in the input
    ($_[0] -eq '1') ? $oneBitsCounter['position11']++ : $zeroBitsCounter['position11']++ | out-null
    ($_[1] -eq '1') ? $oneBitsCounter['position10']++ : $zeroBitsCounter['position10']++ | out-null
    ($_[2] -eq '1') ? $oneBitsCounter['position9']++ : $zeroBitsCounter['position9']++ | out-null
    ($_[3] -eq '1') ? $oneBitsCounter['position8']++ : $zeroBitsCounter['position8']++ | out-null
    ($_[4] -eq '1') ? $oneBitsCounter['position7']++ : $zeroBitsCounter['position7']++ | out-null
    ($_[5] -eq '1') ? $oneBitsCounter['position6']++ : $zeroBitsCounter['position6']++ | out-null
    ($_[6] -eq '1') ? $oneBitsCounter['position5']++ : $zeroBitsCounter['position5']++ | out-null
    ($_[7] -eq '1') ? $oneBitsCounter['position4']++ : $zeroBitsCounter['position4']++ | out-null
    ($_[8] -eq '1') ? $oneBitsCounter['position3']++ : $zeroBitsCounter['position3']++ | out-null
    ($_[9] -eq '1') ? $oneBitsCounter['position2']++ : $zeroBitsCounter['position2']++ | out-null
    ($_[10] -eq '1') ? $oneBitsCounter['position1']++ : $zeroBitsCounter['position1']++ | out-null
    ($_[11] -eq '1') ? $oneBitsCounter['position0']++ : $zeroBitsCounter['position0']++ | out-null

}

# Write-Verbose ("The number of 1s in the first position is: " + $oneBitsCounter['position0'])
# Write-Verbose ("The number of 1s in the second position is: " + $oneBitsCounter['position1'])
# Write-Verbose ("The number of 1s in the third position is: " + $oneBitsCounter['position2'])
# Write-Verbose ("The number of 1s in the fourth position is: " + $oneBitsCounter['position3'])
# Write-Verbose ("The number of 1s in the fifth position is: " + $oneBitsCounter['position4'])
# Write-Verbose ("The number of 1s in the sixth position is: " + $oneBitsCounter['position5'])
# Write-Verbose ("The number of 1s in the seventh position is: " + $oneBitsCounter['position6'])
# Write-Verbose ("The number of 1s in the eighth position is: " + $oneBitsCounter['position7'])
# Write-Verbose ("The number of 1s in the ninth position is: " + $oneBitsCounter['position8'])
# Write-Verbose ("The number of 1s in the tenth position is: " + $oneBitsCounter['position9'])
# Write-Verbose ("The number of 1s in the eleventh position is: " + $oneBitsCounter['position10'])
# Write-Verbose ("The number of 1s in the twelfth position is: " + $oneBitsCounter['position11'])

# Write-Verbose ("The number of 0s in the first position is: " + $zeroBitsCounter['position0'])
# Write-Verbose ("The number of 0s in the second position is: " + $zeroBitsCounter['position1'])
# Write-Verbose ("The number of 0s in the third position is: " + $zeroBitsCounter['position2'])
# Write-Verbose ("The number of 0s in the fourth position is: " + $zeroBitsCounter['position3'])
# Write-Verbose ("The number of 0s in the fifth position is: " + $zeroBitsCounter['position4'])
# Write-Verbose ("The number of 0s in the sixth position is: " + $zeroBitsCounter['position5'])
# Write-Verbose ("The number of 0s in the seventh position is: " + $zeroBitsCounter['position6'])
# Write-Verbose ("The number of 0s in the eighth position is: " + $zeroBitsCounter['position7'])
# Write-Verbose ("The number of 0s in the ninth position is: " + $zeroBitsCounter['position8'])
# Write-Verbose ("The number of 0s in the tenth position is: " + $zeroBitsCounter['position9'])
# Write-Verbose ("The number of 0s in the eleventh position is: " + $zeroBitsCounter['position10'])
# Write-Verbose ("The number of 0s in the twelfth position is: " + $zeroBitsCounter['position11'])


# Calculate the "gamma" for each position by checking whether there were more zeros or ones in that position
# If there were more ones, then the gamma is 1, otherwise it is 0

$gamma = @{
    'position0' = ($oneBitsCounter['position0'] - $zeroBitsCounter['position0'] -gt 0) ? 1 : 0
    'position1' = ($oneBitsCounter['position1'] - $zeroBitsCounter['position1'] -gt 0) ? 1 : 0
    'position2' = ($oneBitsCounter['position2'] - $zeroBitsCounter['position2'] -gt 0) ? 1 : 0
    'position3' = ($oneBitsCounter['position3'] - $zeroBitsCounter['position3'] -gt 0) ? 1 : 0
    'position4' = ($oneBitsCounter['position4'] - $zeroBitsCounter['position4'] -gt 0) ? 1 : 0
    'position5' = ($oneBitsCounter['position5'] - $zeroBitsCounter['position5'] -gt 0) ? 1 : 0
    'position6' = ($oneBitsCounter['position6'] - $zeroBitsCounter['position6'] -gt 0) ? 1 : 0
    'position7' = ($oneBitsCounter['position7'] - $zeroBitsCounter['position7'] -gt 0) ? 1 : 0
    'position8' = ($oneBitsCounter['position8'] - $zeroBitsCounter['position8'] -gt 0) ? 1 : 0
    'position9' = ($oneBitsCounter['position9'] - $zeroBitsCounter['position9'] -gt 0) ? 1 : 0
    'position10' = ($oneBitsCounter['position10'] - $zeroBitsCounter['position10'] -gt 0) ? 1 : 0
    'position11' = ($oneBitsCounter['position11'] - $zeroBitsCounter['position11'] -gt 0) ? 1 : 0
}

# Now assemble the gamma values for each position into a string
$gammaString =  $gamma['position11'].ToString() +
                $gamma['position10'].ToString() +
                $gamma['position9'].ToString() +
                $gamma['position8'].ToString() +
                $gamma['position7'].ToString() +
                $gamma['position6'].ToString() +
                $gamma['position5'].ToString() +
                $gamma['position4'].ToString() +
                $gamma['position3'].ToString() +
                $gamma['position2'].ToString() +
                $gamma['position1'].ToString() +
                $gamma['position0'].ToString()


Write-Verbose ("The gamma string is: " + $gammaString)

# Now convert it to a decimal value.  There is certainly a more sexy way to do this.

$gammavalue = 0
$gamma['position0'] -eq 1 ? ($gammavalue += 1) : $null | out-null
$gamma['position1'] -eq 1 ? ($gammavalue += 2) : $null | out-null
$gamma['position2'] -eq 1 ? ($gammavalue += 4) : $null | out-null
$gamma['position3'] -eq 1 ? ($gammavalue += 8) : $null | out-null
$gamma['position4'] -eq 1 ? ($gammavalue += 16) : $null | out-null
$gamma['position5'] -eq 1 ? ($gammavalue += 32) : $null | out-null
$gamma['position6'] -eq 1 ? ($gammavalue += 64) : $null | out-null
$gamma['position7'] -eq 1 ? ($gammavalue += 128) : $null | out-null
$gamma['position8'] -eq 1 ? ($gammavalue += 256) : $null | out-null
$gamma['position9'] -eq 1 ? ($gammavalue += 512) : $null | out-null
$gamma['position10'] -eq 1 ? ($gammavalue += 1024) : $null | out-null
$gamma['position11'] -eq 1 ? ($gammavalue += 2048) : $null | out-null


Write-Host "The gamma value is :: $gammavalue"

# Now do a similar calculation for epsilon
# If there were more zeros, then the epsilon is 0, otherwise it is 1
# This is the same as the above but with the positions reversed for the value assigned by the ternary operator

$epsilon = @{
    'position0' = ($oneBitsCounter['position0'] - $zeroBitsCounter['position0'] -gt 0) ? 0 : 1
    'position1' = ($oneBitsCounter['position1'] - $zeroBitsCounter['position1'] -gt 0) ? 0 : 1
    'position2' = ($oneBitsCounter['position2'] - $zeroBitsCounter['position2'] -gt 0) ? 0 : 1
    'position3' = ($oneBitsCounter['position3'] - $zeroBitsCounter['position3'] -gt 0) ? 0 : 1
    'position4' = ($oneBitsCounter['position4'] - $zeroBitsCounter['position4'] -gt 0) ? 0 : 1
    'position5' = ($oneBitsCounter['position5'] - $zeroBitsCounter['position5'] -gt 0) ? 0 : 1
    'position6' = ($oneBitsCounter['position6'] - $zeroBitsCounter['position6'] -gt 0) ? 0 : 1
    'position7' = ($oneBitsCounter['position7'] - $zeroBitsCounter['position7'] -gt 0) ? 0 : 1
    'position8' = ($oneBitsCounter['position8'] - $zeroBitsCounter['position8'] -gt 0) ? 0 : 1
    'position9' = ($oneBitsCounter['position9'] - $zeroBitsCounter['position9'] -gt 0) ? 0 : 1
    'position10' = ($oneBitsCounter['position10'] - $zeroBitsCounter['position10'] -gt 0) ? 0 : 1
    'position11' = ($oneBitsCounter['position11'] - $zeroBitsCounter['position11'] -gt 0) ? 0 : 1
}

# Now assemble the gamma values for each position into a string
$epsilonString =  $epsilon['position11'].ToString() +
                $epsilon['position10'].ToString() +
                $epsilon['position9'].ToString() +
                $epsilon['position8'].ToString() +
                $epsilon['position7'].ToString() +
                $epsilon['position6'].ToString() +
                $epsilon['position5'].ToString() +
                $epsilon['position4'].ToString() +
                $epsilon['position3'].ToString() +
                $epsilon['position2'].ToString() +
                $epsilon['position1'].ToString() +
                $epsilon['position0'].ToString()

Write-Verbose ("The epsilon string is: " + $epsilonString)

# Now convert it to a decimal value.  There is surely a more sexy way to do this.

$epsilonValue = 0
$epsilon['position0'] -eq 1 ? ($epsilonValue += 1) : $null | out-null
$epsilon['position1'] -eq 1 ? ($epsilonValue += 2) : $null | out-null
$epsilon['position2'] -eq 1 ? ($epsilonValue += 4) : $null | out-null
$epsilon['position3'] -eq 1 ? ($epsilonValue += 8) : $null | out-null
$epsilon['position4'] -eq 1 ? ($epsilonValue += 16) : $null | out-null
$epsilon['position5'] -eq 1 ? ($epsilonValue += 32) : $null | out-null
$epsilon['position6'] -eq 1 ? ($epsilonValue += 64) : $null | out-null
$epsilon['position7'] -eq 1 ? ($epsilonValue += 128) : $null | out-null
$epsilon['position8'] -eq 1 ? ($epsilonValue += 256) : $null | out-null
$epsilon['position9'] -eq 1 ? ($epsilonValue += 512) : $null | out-null
$epsilon['position10'] -eq 1 ? ($epsilonValue += 1024) : $null | out-null
$epsilon['position11'] -eq 1 ? ($epsilonValue += 2048) : $null | out-null

Write-Host "The epsilon value is :: $epsilonValue"

Write-Host "PART 1 ANSWER :: The gamma value multiplied by the epsilon value is :: " ($gammavalue * $epsilonValue)

####################################################################################
# PART 2

# Oxygen Generator rating calculation


# $mostCommon = @{
#     'position0' = ($oneBitsCounter['position0'] - $zeroBitsCounter['position0'] -ge 0) ? 1 : 0
#     'position1' = ($oneBitsCounter['position1'] - $zeroBitsCounter['position1'] -ge 0) ? 1 : 0
#     'position2' = ($oneBitsCounter['position2'] - $zeroBitsCounter['position2'] -ge 0) ? 1 : 0
#     'position3' = ($oneBitsCounter['position3'] - $zeroBitsCounter['position3'] -ge 0) ? 1 : 0
#     'position4' = ($oneBitsCounter['position4'] - $zeroBitsCounter['position4'] -ge 0) ? 1 : 0
#     'position5' = ($oneBitsCounter['position5'] - $zeroBitsCounter['position5'] -ge 0) ? 1 : 0
#     'position6' = ($oneBitsCounter['position6'] - $zeroBitsCounter['position6'] -ge 0) ? 1 : 0
#     'position7' = ($oneBitsCounter['position7'] - $zeroBitsCounter['position7'] -ge 0) ? 1 : 0
#     'position8' = ($oneBitsCounter['position8'] - $zeroBitsCounter['position8'] -ge 0) ? 1 : 0
#     'position9' = ($oneBitsCounter['position9'] - $zeroBitsCounter['position9'] -ge 0) ? 1 : 0
#     'position10' = ($oneBitsCounter['position10'] - $zeroBitsCounter['position10'] -ge 0) ? 1 : 0
#     'position11' = ($oneBitsCounter['position11'] - $zeroBitsCounter['position11'] -ge 0) ? 1 : 0
# }

# $leastCommon = @{
#     'position0' = ($oneBitsCounter['position0'] - $zeroBitsCounter['position0'] -le 0) ? 1 : 0
#     'position1' = ($oneBitsCounter['position1'] - $zeroBitsCounter['position1'] -le 0) ? 1 : 0
#     'position2' = ($oneBitsCounter['position2'] - $zeroBitsCounter['position2'] -le 0) ? 1 : 0
#     'position3' = ($oneBitsCounter['position3'] - $zeroBitsCounter['position3'] -le 0) ? 1 : 0
#     'position4' = ($oneBitsCounter['position4'] - $zeroBitsCounter['position4'] -le 0) ? 1 : 0
#     'position5' = ($oneBitsCounter['position5'] - $zeroBitsCounter['position5'] -le 0) ? 1 : 0
#     'position6' = ($oneBitsCounter['position6'] - $zeroBitsCounter['position6'] -le 0) ? 1 : 0
#     'position7' = ($oneBitsCounter['position7'] - $zeroBitsCounter['position7'] -le 0) ? 1 : 0
#     'position8' = ($oneBitsCounter['position8'] - $zeroBitsCounter['position8'] -le 0) ? 1 : 0
#     'position9' = ($oneBitsCounter['position9'] - $zeroBitsCounter['position9'] -le 0) ? 1 : 0
#     'position10' = ($oneBitsCounter['position10'] - $zeroBitsCounter['position10'] -le 0) ? 1 : 0
#     'position11' = ($oneBitsCounter['position11'] - $zeroBitsCounter['position11'] -le 0) ? 1 : 0
# }

# $positionValuesTable = @{
#     'position0' = 1
#     'position1' = 2
#     'position2' = 4
#     'position3' = 8
#     'position4' = 16
#     'position5' = 32
#     'position6' = 64
#     'position7' = 128
#     'position8' = 256
#     'position9' = 512
#     'position10' = 1024
#     'position11' = 2048
# }

$leastCommon = @{
    '1' = 0
    '0' = 0
}

function findLeastCommonValueForPosition {
    param (
        [Parameter()][int32]$position
    )
    # Returns the least common value for the characters in the given position in the list of strings passed in

    $tracker = @{}
    $position
    
    $datapoints | ForEach-Object { 
        if ($position -le $_.count) {
            $tracker[$_[$position]] += 1
        }
    }

    $tracker

    $result = ($tracker[1] -ge $tracker[0]) ? '1' : '0'

    Write-Verbose "Returning $result"
    # We need the least common so return the key with the lowest value
    return $result
}


$dataPoints = (Get-Content $inputfile)  # start with all data values in the set

0..11 | % { 
    $leastCommon[$_] = findLeastCommonValueForPosition($_)
}

$leastCommon
exit

$positions = "position4", "position3", "position2", "position1", "position0"

# Make a new array of integers which are the integer representation of the binary values in the input data
[int32[]] $integerDataPoints = $dataPoints | ForEach-Object {[Convert]::ToInt32($_,2)}

$oxygenDataPoints = $integerDataPoints

Write-Verbose ("There are " + $oxygenDataPoints.Length + " data points")



$positions | ForEach-Object {

    $currentPosition = $_
    $newOxygenDataPoints = @()

    if ($oxygenDataPoints.Count -gt 1) { 
        Write-Verbose "Sifting on position $currentPosition"
        # Write-Verbose ("Position index is " + $positions.IndexOf($currentPosition) )

        if ($mostCommon[$currentPosition] -eq 1) {  # sift for ones.
            Write-Verbose "Looking for most common in position $currentPosition"
            $oxygenDataPoints | % {
                if (($mostCommon[$currentPosition] -eq 1) -and ($_ -band (1 -shl (11 - $positions.IndexOf($currentPosition))))) {
                    Write-Verbose ("Value $_ has a 1 bit in position $currentPosition `t(" + [Convert]::ToString($_,2).PadLeft(12,'0') + ")")
                    $newOxygenDataPoints += $_
                } else {
                    # Write-Verbose ("Value $_ has a 0 bit in position $currentPosition (" + [Convert]::ToString($_,2) + ")")
                }
            }

        } else {
            # 1 is not the most common value so sift for zeroes instead.  Notice the bang in the comparison to invert the -band
            Write-Verbose "Looking for least common in position $currentPosition"
            $oxygenDataPoints | % {
                if (($leastCommon[$currentPosition] -eq 1) -and (!($_ -band (1 -shl (11 - $positions.IndexOf($currentPosition)))))) {
                    Write-Verbose ("Value $_ has a 0 bit in position $currentPosition `t(" + [Convert]::ToString($_,2).PadLeft(12,'0') + ")")
                    $newOxygenDataPoints += $_
                } else {
                    # Write-Verbose ("Value $_ has a 1 bit in position $currentPosition (" + [Convert]::ToString($_,2) + ")")
                }
            }
        }

        if ($newOxygenDataPoints) { 
            $oxygenDataPoints = $newOxygenDataPoints
            Remove-Variable -Name newOxygenDataPoints
        }

        write-verbose ($OxygenDataPoints.Count.ToString() + " data points left")
    }
}

$oxygenRating = $oxygenDataPoints[0]

Write-Host ("Oxygen Generator Rating is :: " + $oxygenRating)

######################################################

# Now get the scrubber rating by doing the same thing with flipped conditions (least common instead of most common)

$scrubberDataPoints = $integerDataPoints

Write-Verbose ("There are " + $scrubberDataPoints.Length + " scrubber data points")

$positions | ForEach-Object {

    $currentPosition = $_
    $newScrubberDataPoints = @()
    $valueToSeek = $leastCommon[$currentPosition] # will be 0 or 1

    Write-Verbose ("Sifting for $valueToSeek in position $currentPosition")

   #  Write-Verbose "Looking for least common in position $currentPosition"

    if ($scrubberDataPoints.Count -gt 1) {         
        $scrubberDataPoints | % {
            Write-Verbose ("Value $_ has binary representation `t`t`t`t(" + [Convert]::ToString($_,2).PadLeft(12,'0') + ")")
            Write-Verbose ("Seeking a match with `t`t`t`t`t`t(" + [Convert]::ToString($positionValuesTable[$currentPosition],2).PadLeft(12,'0') + ")")

            if ($valueToSeek -eq 1) {
                if ($_ -band $positionValuesTable[$currentPosition]) {
                    Write-Verbose ("Keeping value $_ because it has $valueToSeek in position $currentPosition `t(" + [Convert]::ToString($_,2).PadLeft(12,'0') + ")")
                    $newScrubberDataPoints += $_
                } else {
                    write-verbose ("Dropping value $_ because it does not have $valueToSeek in position $currentPosition`t(" + [Convert]::ToString($_,2).PadLeft(12,'0') + ")")
                }
            } else {
                if (!($_ -band $positionValuesTable[$currentPosition])) {
                    Write-Verbose ("Keeping value $_ because it has $valueToSeek in position $currentPosition `t(" + [Convert]::ToString($_,2).PadLeft(12,'0') + ")")
                    $newScrubberDataPoints += $_
                } else {
                    write-verbose ("Dropping value $_ because it does not have $valueToSeek in position $currentPosition`t(" + [Convert]::ToString($_,2).PadLeft(12,'0') + ")")
                }
            }
        }

        if ($newScrubberDataPoints) { 
            $scrubberDataPoints = $newScrubberDataPoints
            Remove-Variable -Name newScrubberDataPoints
        }

        write-verbose ($scrubberDataPoints.Count.ToString() + " data point(s) left")
    }
}

$scrubberRating = $scrubberDataPoints[0]

Write-Host ("CO2 Scrubber Rating is :: " + $scrubberRating)

Write-Host ("PART 2 ANSWER -->  The Oxygen rating multiplied by the CO2 rating is :: " + ($oxygenRating * $scrubberRating))
