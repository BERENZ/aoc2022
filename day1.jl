

## solution 1 
fname = "data/input1.txt"

result = Int[]
count = 0
for line in eachline(fname)
    if !isempty(line)
        count += parse(Int, line)
    else
        push!(result, count)
        count = 0
    end
end

result_new = sort(input1,rev = true) 
result_new[1]
sum(result_new[1:3])

## alternative
input1=readlines(fname)  
input1 = join(input1, "|")
input1 = split(input1, "||")
input1 = split.(input1 , "|")
input1 = map(x -> parse.(Int, x), input1)
input1 = map(sum, input1)
result = sort(input1,rev = true) 
result[1]
sum(result[1:3])

## alternative 2

result = readlines(fname) |>
    x -> join(x, "|") |>
    x -> split(x, "||") |>
    x -> split.(x, "|") |>
    x -> map(y -> parse.(Int, y), x) |>
    x -> map(sum, x) |>
    x -> sort(x, rev = true)


