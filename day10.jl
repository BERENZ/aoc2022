p1_score = 0
p2_X_history = []
cycle = 0
X = 1
k = 1

#input = ["noop", "addx 3", "addx -5"]
input = readlines("data/input10-example.txt")

## part 1 & 2

for line in input
    if contains(line, "addx")
        inst, number = split(line)
        for i in 1:2
            cycle +=1 
            if (cycle ∈ [20, 60, 100, 140, 180, 220])
                println([cycle, X, cycle*X, p1_score +=cycle*X])
            end
        end
        X += parse(Int, number)
        row = Int(ceil(cycle / 40))
        push!(p2_X_history, [row, X+1])
    end
    if contains(line, "noop")
        cycle += 1
        if (cycle ∈ [20, 60, 100, 140, 180, 220])
            println([cycle, X, cycle*X, p1_score +=cycle*X])
        end
    end
    k +=1
end

## part 2
A = fill(".", 6, 40)
for cell in p2_X_history
    if (cell[2] == 0) 
        continue
    end
    A[cell[1], cell[2]] = "#"
end

