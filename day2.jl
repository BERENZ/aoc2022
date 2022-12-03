## solution 1 
fname = "data/input2.txt"

#Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock.
#A for Rock, B for Paper, and C for Scissors
#X for Rock, Y for Paper, and Z for Scissors
#(1 for Rock, 2 for Paper, and 3 for Scissors) 
#(0 if you lost, 3 if the round was a draw, and 6 if you won).

## Part 1
mapping = Dict(
    "A X" => 1 + 3,
    "A Y" => 2 + 6,
    "A Z" => 3 + 0,
    "B X" => 1 + 0,
    "B Y" => 2 + 3,
    "B Z" => 3 + 6,
    "C X" => 1 + 6,
    "C Y" => 2 + 0,
    "C Z" => 3 + 3)

mapping = sort(mapping)

## check
example = ["A Y", "B X", "C Z"]
sum([mapping[i] for i in example])

## result
input2 = readlines(fname)
sum([mapping[i] for i in input2])

## Part 2
# X means you need to lose, 
# Y means you need to end the round in a draw, 
# and Z means you need to win. Good luck!"
#Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock.
#A for Rock, B for Paper, and C for Scissors
#(1 for Rock, 2 for Paper, and 3 for Scissors) 
mapping2 = Dict(
    "A X" => 0 + 3,
    "A Y" => 3 + 1,
    "A Z" => 6 + 2,
    "B X" => 0 + 1,
    "B Y" => 3 + 2,
    "B Z" => 6 + 3,
    "C X" => 0 + 2,
    "C Y" => 3 + 3,
    "C Z" => 6 + 1)

sum([mapping2[i] for i in example])

sum([mapping2[i] for i in input2])



