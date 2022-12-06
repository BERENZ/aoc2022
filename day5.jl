## push! and pop!

## trying to parse but not working so TODO
input_example = readlines("data/input5-example.txt")
stacks_raw = permutedims(hcat(split.(input_example[1:3], r"\s+")...))
stacks_raw = [reverse(replace.(stacks_raw[:, i], r"\[|\]" => "")) for i in 1:3]
stacks = filter.(x -> length(x) > 0, stacks_raw)

## parse moves 
moves_raw = input_example[6:end]
moves = zeros(Int, length(moves_raw), 3)
for (i, move) in enumerate(moves_raw)
    moves[i,:]=parse.(Int, SubString.(moves_raw[i], findall(r"\d{1,2}", moves_raw[i])))
end

## changing each once using pop! and push!
for e in eachslice(moves, dims = 1)
    ## how many
    for i in 1:e[1]
        ## from 
        push!(stacks[e[3]], pop!(stacks[e[2]]))
    end
end

result = join([s[end] for s in stacks])

## part1

input = readlines("data/input5.txt")
stack_raw = reverse(input[1:8])
## by hand -- todo
stacks  = [
    ["S", "M", "R", "N", "W", "J", "V", "T"],
    ["B", "W", "D", "J", "Q", "P", "C", "V"],
    ["B", "J", "F", "H", "D", "R", "P"],
    ["F", "R", "P", "B", "M", "N", "D"],
    ["H", "V", "R", "P", "T", "B"],
    ["C", "B", "P", "T"],
    ["B", "J", "R", "P", "L"],
    ["N", "C", "S", "L", "T", "Z", "B", "W"],
    ["L", "S", "G"]
]

## moves
moves_raw = input[11:end]
moves = zeros(Int, length(moves_raw), 3)
for (i, move) in enumerate(moves_raw)
    moves[i,:]=parse.(Int, SubString.(moves_raw[i], findall(r"\d{1,2}", moves_raw[i])))
end

## changing
for e in eachslice(moves, dims = 1)
    ## how many
    for i in 1:e[1]
        ## from 
        push!(stacks[e[3]], pop!(stacks[e[2]]))
    end
end

result_part1 = join([s[end] for s in stacks])

## part2
stacks  = [
    ["S", "M", "R", "N", "W", "J", "V", "T"],
    ["B", "W", "D", "J", "Q", "P", "C", "V"],
    ["B", "J", "F", "H", "D", "R", "P"],
    ["F", "R", "P", "B", "M", "N", "D"],
    ["H", "V", "R", "P", "T", "B"],
    ["C", "B", "P", "T"],
    ["B", "J", "R", "P", "L"],
    ["N", "C", "S", "L", "T", "Z", "B", "W"],
    ["L", "S", "G"]
]

## changing
for e in eachslice(moves, dims = 1)
    ## how many
    from_len = length(stacks[e[2]])
    #push!(stacks[e[3]], splice!(stacks[e[2]], (from_len-e[1]+1):from_len)...)
    append!(stacks[e[3]], splice!(stacks[e[2]], (from_len-e[1]+1):from_len))
end

result_part2 = join([s[end] for s in stacks])


