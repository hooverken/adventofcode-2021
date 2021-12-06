# Advent of Code, Day 4 part 1

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)][string]$movesFile,
    [Parameter(Mandatory=$true)][string]$boardsFile
)


# Define a type (class) to use for the bingo squares
class bingoSquare {
    [int32]$value
    [boolean]$isSelected

    [string]toString() {
        return ("{0} | {1} " -f $this.value, $this.isSelected)
    }
}


function initializeBingoBoard {

    $row1 = @(
        [bingoSquare]@{  value = 0 ; isSelected = $false  },
        [bingoSquare]@{  value = 0 ; isSelected = $true  },
        [bingoSquare]@{  value = 0 ; isSelected = $false  },
        [bingoSquare]@{  value = 0 ; isSelected = $true },
        [bingoSquare]@{  value = 0 ; isSelected = $false  }
    )

    $row2 = @(
        [bingoSquare]@{  value = 0 ; isSelected = $true  },
        [bingoSquare]@{  value = 0 ; isSelected = $false  },
        [bingoSquare]@{  value = 0 ; isSelected = $true  },
        [bingoSquare]@{  value = 0 ; isSelected = $false },
        [bingoSquare]@{  value = 0 ; isSelected = $true  }
    )

    $row3 = @(
        [bingoSquare]@{  value = 0 ; isSelected = $false  },
        [bingoSquare]@{  value = 0 ; isSelected = $true  },
        [bingoSquare]@{  value = 0 ; isSelected = $false  },
        [bingoSquare]@{  value = 0 ; isSelected = $true },
        [bingoSquare]@{  value = 0 ; isSelected = $false  }
    )

    $row4 = @(
        [bingoSquare]@{  value = 0 ; isSelected = $true  },
        [bingoSquare]@{  value = 0 ; isSelected = $false  },
        [bingoSquare]@{  value = 0 ; isSelected = $true  },
        [bingoSquare]@{  value = 0 ; isSelected = $false },
        [bingoSquare]@{  value = 0 ; isSelected = $true  }
    )

    $row5 = @(
        [bingoSquare]@{  value = 0 ; isSelected = $false  },
        [bingoSquare]@{  value = 0 ; isSelected = $true  },
        [bingoSquare]@{  value = 0 ; isSelected = $false  },
        [bingoSquare]@{  value = 0 ; isSelected = $true },
        [bingoSquare]@{  value = 0 ; isSelected = $false  }
    )

    $board = @($row1,$row2,$row3,$row4,$row5)

    return $board
}

function populateBingoBoard {
    # Populate a bingo board.  Each square on the board has a an object in it with
    # The number (value) for that square and a boolean status isSelected (false = not picked, true = picked)
    param (
        [Parameter(ValueFromPipeline=$true)][object]$board,
        [Parameter(ValueFromPipeline=$true)][string]$row1,
        [Parameter(ValueFromPipeline=$true)][string]$row2,
        [Parameter(ValueFromPipeline=$true)][string]$row3,
        [Parameter(ValueFromPipeline=$true)][string]$row4,
        [Parameter(ValueFromPipeline=$true)][string]$row5
    )

    $row = 0

    $row1,$row2,$row3,$row4,$row5 | ForEach-Object {  # process each row 

        # Write-verbose "Processing row $row"
  
        $rowElements = $_ -split '\s+' | where { $_.trim() -ne "" } # split on whitespace, strip out blank lines
        
        # Write-Verbose ("There are " + $rowElements.Count + " row elements")
        # Write-Verbose ("Cleaned up input :: $rowelements")

        for ($i=0 ; $i -lt $rowelements.Count ; $i++) {
            # Write-Verbose ("Adding value `"" + $rowElements[$i] + "`"")
            # if (!($rowElements[$i])) { $rowelements[$i] = 0 }
            # Write-verbose ("Setting element [$row][$i] to value "+ $rowElements[$i].ToInt32($null))
            $board[$row][$i].value = $rowElements[$i].ToInt32($null) # populate current row
            $board[$row][$i].isSelected = $false
        }
        $row++
    }

    return $board
}

function outputBingoBoard {
    # Outputs a board to the screen as a 5 x 5 matrix of numbers. Squares that were selected are highlighted in yellow

    param (
        [Parameter(ValueFromPipeline=$true)][object]$outputBoard
    )

    Write-Host "`n"

    for ($i = 0 ; $i -lt 5 ; $i++) {

        $outputBoard[$i] | ForEach-Object {
            #Write-Verbose ("Value is " + $_.value)
            if ($_.isSelected -eq $true) {
                #Write-Verbose "Item is selected"
                Write-Host $_.value -NoNewline -ForegroundColor Yellow # highlight in yellow if selected
            } else {
                #Write-Verbose "Item is not selected"
                Write-Host $_.value -NoNewline
            }
            write-host "`t" -NoNewline  # tab to space out values evenly
        }
        write-host " "
    }
}

function selectNumberOnBoard {
    # This plays a number on the board by setting the isSelected value to TRUE if the number is on the board
    param (
        [Parameter(ValueFromPipeline=$true)][object]$bingoBoard,
        [Parameter(ValueFromPipeline=$true)][int32]$number
    )

    # Go through the board and if any square has the same value as $number set its isSelected value to $true
    # That's it.
  
    # Write-Verbose "Looking for $number..."
    $foundCounter = 0 # How many times we found this number on the board

    $bingoBoard  | % { # for each row on the board
        $_ | % {  # for each item in the row
            if ($_.value -eq $number) {
                # Write-Verbose ("$number found on board")
                $_.isSelected = $true
                $foundCounter++
            }
        }
    }
    # Write-Verbose "Value $number was found $foundCounter times on this board."

    # outputBingoBoard -outputBoard $bingoBoard

    return $bingoBoard
}

function checkIfBingoExists {
    # returns TRUE if a bingo exists on this board
    # For this game, a bingo is 5 selected numbers in a row either horizontally or vertically not diagonally (yet?)
    param (
        [Parameter(ValueFromPipeline=$true)][object]$boardToCheck
    )

    #  We will check both rows and columns using the same selector to keep things simple.

    $bingoFound = "no"

    for ($s = 0 ; $s -lt 5 ; $s++ ) {
        $rowisAWinner = $false
        $colIsAWinner = $false
        # Write-verbose ("Checking Row/Column $s...")
        $rowIsAWinner = (($boardToCheck[$s][0].isSelected) -and ($boardToCheck[$s][1].isSelected) -and  ($boardToCheck[$s][2].isSelected) -and ($boardToCheck[$s][3].isSelected) -and ($boardToCheck[$s][4].isSelected))
        $colIsAWinner = (($boardToCheck[0][$s].isSelected) -and ($boardToCheck[1][$s].isSelected) -and ($boardToCheck[2][$s].isSelected) -and ($boardToCheck[3][$s].isSelected) -and ($boardtoCheck[4][$s].isSelected))
        # $colIsAWinner ? { Write-Verbose ("Column $s BINGO!") } : { Write-Verbose ("No Bingo in column $s") }
        # $rowIsAWinner ? { Write-Verbose ("Row $s BINGO!") } : { Write-Verbose ("No Bingo in row $s") }

        if ($rowIsAWinner -or $colIsAWinner) {
            $bingoFound = "yes"
            break
        }
    }

    # ($bingoFound -eq "yes") ? { Write-Verbose ("BINGO FOUND") } : { Write-Verbose ("No Bingo") }

    return $bingoFound
}

function calculateScore {
    # The score is all of the non-selected numbers on the board.
    [Parameter(ValueFromPipeline=$true)][object]$board

    Write-Verbose "Calculating score..."

    # outputBingoBoard -outputBoard $board

    $total = 0
    $board | % { # for each row on the board
        $_ | % {  # for each item in the row
            if ($false -eq $_.isSelected) { # if this square is >> NOT << selected
                $squareValue = $_.value
                $total += $squareValue
                # Write-Verbose "Adding $squareValue to score (new total is $total)"
            }
        }
    }

    return $total
}

############################################################################################
# Define the boards - we don't know how many there will be

$boardData = gc $boardsFile

# Board data is groups of 5 x 5 sets of numbers with blank lines between them.
# We need to chop up the input and populate boards using it.
# We'll chop by looking for input lines that are "too short" and assuming that they are separators between boards

$bingoBoards = [System.Collections.ArrayList]@()  # Using an arraylist as the type so we can add boards as necessary

for ($i = 0 ; $i -lt $boardData.Length ; $i++) {

    $currentRow = $boardData[$i]

    if ($currentRow.Length -lt 5) { # too short to hold a valid input line in this puzzle
        $line++
    } else { 
        # Write-Verbose ("Board found")
        $newboard = initializeBingoBoard
        $row1 = $boardData[$i++]
        $row2 = $boardData[$i++]
        $row3 = $boardData[$i++]
        $row4 = $boardData[$i++]
        $row5 = $boardData[$i]

        # Write-verbose ("New board row 1 :: " + $row1)
        # Write-verbose ("New board row 2 :: " + $row2)
        # Write-verbose ("New board row 3 :: " + $row3)
        # Write-verbose ("New board row 4 :: " + $row4)
        # Write-verbose ("New board row 5 :: " + $row5)

        $newboard = populateBingoBoard -board $newboard -row1 $row1 -row2 $row2 -row3 $row3 -row4 $row4 -row5 $row5

        $numberOfBoards = $bingoBoards.Add($newboard)  # The Add() method returns the new number of items in the arrayList.
    }
}

write-verbose ( $bingoBoards.Count.ToString() + " boards loaded.")

# Now that we have the boards loaded let's start playing numbers...

$movesData = (Get-Content $movesFile).split(',').ToInt32($null)  # comma-separated string, converted to an array of int32's

Write-Verbose ($movesData.Count.ToString() + " moves loaded.")

$bingoExists = "no" 
$firstBingoIndex = 99999

$winningBoards = @{} # hash table to collect winning boards and the winning numbers

$movesData | ForEach-Object { # Play the moves one at a time and check for a bingo after each one.

    $calledNumber = $_

    if ($winningBoards.Keys.Count -lt $bingoBoards.Count) {

        # Play the number on each board and see if it's a winner
        for ($boardIndex = 0 ; ($boardIndex -lt $bingoBoards.Count); $boardIndex++) { 

            if ($false -eq $winningBoards.ContainsKey($boardindex)) { # skip boards that have already bingo'd
                # Write-Verbose ("Playing number $calledNumber on board $boardIndex...")
                $bingoBoards[$boardIndex] = selectNumberOnBoard -bingoBoard $bingoBoards[$boardIndex] -number $calledNumber

                # Check if this board now has a bingo
                $BingoExists = checkIfBingoExists -boardToCheck $bingoBoards[$boardindex]

                if ($bingoExists -eq "yes") {  # If this is a winner
                    $winningBoards.Add($boardIndex,$calledNumber) # Add this board's index and the final number to the list of winners
                    $lastBingoIndex = $boardIndex  # Save the index of this board since it's the most recent bingo (for part 2)

                    # If this is the first bingo found, preserve its index for part 1 scoring
                    if ($firstBingoIndex -eq 99999) {  
                        $firstBingoIndex = $boardIndex
                    }

                    outputBingoBoard -outputBoard $bingoBoards[$boardIndex]     # output the board
                    Write-Host ">> BINGO ON BOARD $boardIndex with number $calledNumber <<" -ForegroundColor Yellow

                } else {
                    # Write-Verbose "No bingo on board $boardindex"
                }
            }
        }
    }
    # Write-Verbose ("Winning boards count :: " + $winningBoards.Keys.Count.ToString())
}


# Calculate the scores

$total = 0
$bingoBoards[$firstBingoIndex] | ForEach-Object { # for each row on the board
    $_ | ForEach-Object {  # for each item in the row
        if ($false -eq $_.isSelected) { # if this square is >> NOT << selected
            $squareValue = $_.value
            $total += $squareValue
            # Write-Verbose "Adding $squareValue to score (new total is $total)"
        }
    }
}

Write-Host "`n=========================================================="
Write-Host " >>> PART 1 <<<"
Write-Host "=========================================================="
outputBingoBoard -outputBoard $bingoBoards[$firstBingoIndex]
Write-Host "the first board to win was board" $firstBingoIndex
Write-Host "The last number played for board $firstBingoIndex was" $winningBoards[$firstBingoIndex]
Write-Host "The sum of the non-selected squares in board $firstBingoIndex is $total"
Write-Host ">> PART 1 ANSWER << Score for board " $firstBingoIndex " is :: " ($winningBoards[$firstBingoIndex] * $total) -fore Yellow

# Part 2 - figure out which board would win LAST and calculate its score

# the last board to win will have its index number as the last item in the winning boards list/array
$total = 0
$bingoBoards[$lastBingoIndex] | % { # for each row on the board
    $_ | ForEach-Object {  # for each item in the row
        if ($false -eq $_.isSelected) { # if this square is >> NOT << selected
            $squareValue = $_.value
            $total += $squareValue
            # Write-Verbose "Adding $squareValue to score (new total is $total)"
        }
    }
}

Write-Host "`n=========================================================="
Write-Host " >>> PART 2 <<<"
Write-Host "=========================================================="
outputBingoBoard -outputBoard $bingoBoards[$firstBingoIndex]
Write-Host "`nThe last board to win was board" $lastBingoIndex
Write-Host "The last number played was" $winningBoards[$lastBingoIndex]
Write-Host "The total score for board" $lastBingoIndex "is $total"
Write-Host ">> PART 2 ANSWER << Score for board" $lastBingoIndex "is :: " ($winningBoards[$lastBingoIndex] * $total) -fore Yellow
