
test = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
test = read("data/input6.txt", String)

## part 1
for i in 1:(length(test)-3)
    chars = test[i:(i+3)]
    chars_uniqe_n = length(unique(split(chars, "")))
    if chars_uniqe_n == 4
        println(i + 3)
        break
    end
end

## part 2
#test = "bvwbjplbgvbhsrlpgdmjqwftvncz"
test = read("data/input6.txt", String)

for i in 1:(length(test)-13)
    chars = test[i:(i+13)]
    chars_uniqe_n = length(unique(split(chars, "")))
    if chars_uniqe_n == 14
        println(i + 13)
        break
    end
end
