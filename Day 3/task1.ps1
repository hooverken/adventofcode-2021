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

Write-Host "`n>>> PART 1 ANSWER <<< The gamma value multiplied by the epsilon value is :: " ($gammavalue * $epsilonValue) 

####################################################################################
# PART 2

function findLeastCommonValueForPosition {
    # Returns the value that is least used in the given string position ('1' or '0')
    # Ties (where both values match) are won by zeroes for least-used test
    param (
        [Parameter(ValueFromPipeline=$true)][string[]]$itemlist,
        [Parameter(ValueFromPipeline=$true)][int32]$position
    )
    # Returns the least common value for the characters in the given position in the list of strings passed in

    begin {
        $zerocounter = 0
        $onecounter = 0
    } 

    process {    
        $datapoints | ForEach-Object { 
            # write-verbose ("Value in position $position is " + $_[$position])
            if ($_[$position] -eq '0') { $zerocounter++} else { $onecounter++ }
        }
    }
    end {   
        write-verbose "Number of zeros is $zerocounter"
        write-verbose "Number of ones is $onecounter"
    
        if ($zerocounter -le $onecounter) { return '0' }
        if ($onecounter -lt $zerocounter) { return '1' }
    }
}


function findMostCommonValueForPosition {
    # Returns the value that is least used in the given string position ('1' or '0')
    # Ties (where both values match) are won by ones for most-used test
    param (
        [Parameter(ValueFromPipeline=$true)][string[]]$itemlist,
        [Parameter(ValueFromPipeline=$true)][int32]$position
    )
    # Returns the least common value for the characters in the given position in the list of strings passed in

    begin {
        $zerocounter = 0
        $onecounter = 0
    } 

    process {    
        $datapoints | ForEach-Object { 
            # write-verbose ("Value in position $position is " + $_[$position])
            if ($_[$position] -eq '0') { $zerocounter++} else { $onecounter++ }
        }
    }

    end {   
        write-verbose "Number of zeros is $zerocounter"
        write-verbose "Number of ones is $onecounter"
    
        if ($zerocounter -gt $onecounter) { return '0' }
        if ($onecounter -ge $zerocounter) { return '1'}
    }

}

#########################################################

# Calculate Oxygen Generator Value 
$dataPoints = (Get-Content $inputfile)  # start with all data values in the set

0..$dataPoints[0].Length | % { 
    write-verbose ("Counting most common values for position $_ ")

    $position = $_ 

    if ($datapoints.Length -gt 1) {
        $filteredDataPoints = @()
        $target = ((findmostCommonValueForPosition -position $_ -itemlist $dataPoints) -eq '1')? 1 : 0
    
        Write-Verbose ("Most common value in position $_ is $target")
        Write-Verbose ("There are " + $dataPoints.Length + " data values in the list: ")
        $dataPoints | % { 
            # Write-Verbose ("Value of $_ in position $position is " + $_[$position])
            if ($_[$position] -eq $target.ToString()) {
                Write-Verbose "Keeping $_"
                $filteredDataPoints += $_
            } else {
                Write-Verbose "Rejecting $_"
            }
        }
        $dataPoints = $filteredDataPoints
    } else {
        Write-Verbose "Only one data point left"
    }
}

$oxygenGeneratorValue = $dataPoints

Write-Host "`nOxygen Generator value is `t$oxygenGeneratorValue (decimal value" ([Convert]::ToInt32($oxygenGeneratorValue,2))")"

###############################################
# Now do the CO2 Scrubber Value

$dataPoints = (Get-Content $inputfile)  # reload with all data values in the set

0..$dataPoints[0].Length | % { 
    write-verbose ("Counting least common values for position $_")

    $position = $_ 

    if ($datapoints.Length -gt 1) {
        $filteredDataPoints = @()
        $target = ((findLeastCommonValueForPosition -position $_ -itemlist $dataPoints) -eq '1') ? 1 : 0
    
        Write-Verbose ("There are " + $dataPoints.Length + " data values in the list")
        Write-Verbose ("Least common value in position $_ is $target")

        $dataPoints | % { 
            Write-Verbose ("Value of $_ in position $position is " + $_[$position])
            if ($_[$position] -eq $target.ToString()) {
                Write-Verbose "Keeping $_"
                $filteredDataPoints += $_
            } else {
                Write-Verbose "Rejecting $_"
            }
        }
        $dataPoints = $filteredDataPoints
    } else {
        Write-Verbose "Only one data point left"
    }
}
$CO2ScrubberValue = $dataPoints

Write-Host "CO2 Scrubber value is `t`t$CO2ScrubberValue (decimal value" ([Convert]::ToInt32($CO2ScrubberValue,2))")"

$LifeSupportRating = ([Convert]::ToInt32($oxygenGeneratorValue,2))* ([Convert]::ToInt32($CO2ScrubberValue,2))
Write-Host "`n>>> PART 2 ANSWER <<<  Life support rating (Oxygen Generator value * CO2 Scrubber Value) is $lifeSupportRating"
