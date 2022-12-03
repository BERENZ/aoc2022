## solution 

fname = "data/input3.txt"
example = ["vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
           "PmmdzqPrVvPwwTWBwg", "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
           "ttgJtRGJQctTZtZT", "CrZsJsPPZsGzwwsLwLmpwMDw"]



scores = Dict()
for (index, value) in enumerate( vcat('a':'z', 'A':'Z'))
    scores[value] = index
end


function find_common(item)
    half = Int(length.(item) / 2)
    half1 = split(item[1:half], "")
    half2 = split(item[(half+1):end], "")
    common = intersect(half1, half2)[1]
    return scores[common[1]]
end

## example
sum(find_common.(example))

## input
input3=readlines(fname)
sum(find_common.(input3))

#### part 2
function find_common_three(items)
    unique_chars = map(x ->  unique(split(x, "")), items)
    return intersect(unique_chars[1], unique_chars[2], unique_chars[3])[1]
end

## example 
example_common = [find_common_three(example[i:(i+2)]) for i in collect(1:3:length(example))]
sum(scores[i[1]] for i in example_common)

## solution
input3_common = [find_common_three(input3[i:(i+2)]) for i in collect(1:3:length(input3))]
input3_common = filter(!isempty,input3_common)
sum(scores[i[1]] for i in input3_common)

