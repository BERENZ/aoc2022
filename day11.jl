## eval(Meta.parse())
function get_monkeys_data(fname)

    monkeys = Dict()
    count = 0
    input = readlines(fname)
    for line in input
        
        if contains(line, "Monkey")
            global monkeys_dict = Dict()
        end

        if contains(line, "Starting")
            monkeys_dict["items"] = eachmatch(r"\d{1,3}", line) |> 
                    collect .|> (x -> x.match) .|> (x -> parse(BigInt, x))
        end

        if contains(line, "Operation")
            monkeys_dict["operation"] = split(line, ": ")[2]
        end

        if contains(line, "Test")
            monkeys_dict["test"] =  match(r"\d{1,3}", line).match |> (x -> parse(Int,x))
        end

        if contains(line, "If true")
            monkeys_dict["monkey_true"] =  string(match(r"\d{1,3}", line).match |> (x -> parse(Int,x)))
        end

        if contains(line, "If false")
            monkeys_dict["monkey_false"] =  string(match(r"\d{1,3}", line).match |> (x -> parse(Int,x)))
        end

        if (line == "") | (line == input[end])
            #append!(monkeys, [copy(monkeys_dict)])
            monkeys[string(count)] = copy(monkeys_dict)
            count += 1
        end
    end
    return sort(monkeys)
end

monkeys = get_monkeys_data("data/input11.txt")
monkeys_times = sort(Dict(keys(monkeys) .=> zeros(Int ,length(monkeys))))
old, new = 0, 0
for iter in 1:20
    for monkey in keys(monkeys)
        #println("Monkey: ", monkey)
        items = copy(monkeys[monkey]["items"])
        monkeys_times[monkey] += length(items)
        if isempty(items) 
            continue
        end
        for item in items
            #println(" item processed: ", item)
            old = item 
            eval(Meta.parse(monkeys[monkey]["operation"]))
            new  = Int(floor(new / 3))
            if (new % monkeys[monkey]["test"] == 0)
                push!(monkeys[monkeys[monkey]["monkey_true"]]["items"], new)
            else
                push!(monkeys[monkeys[monkey]["monkey_false"]]["items"], new)
            end
            popfirst!(monkeys[monkey]["items"])
        end
    end
end

part1 = reduce(*,sort(collect(values(monkeys_times)))[(end-1):end])

## part 2
monkeys = get_monkeys_data("data/input11-example.txt")
monkeys_times = sort(Dict(keys(monkeys) .=> zeros(Int ,length(monkeys))))

for iter in 1:1000
    if iter % 500 == 0
        println(iter)
    end
    for monkey in keys(monkeys)
        items = copy(monkeys[monkey]["items"])
        monkeys_times[monkey] += length(items)
        if isempty(items) 
            continue
        end
        for item in items
            old = item
            eval(Meta.parse(monkeys[monkey]["operation"]))
            #new  = Int(floor(new / 3))
            if (new % monkeys[monkey]["test"] == 0)
                push!(monkeys[monkeys[monkey]["monkey_true"]]["items"], new)
            else
                push!(monkeys[monkeys[monkey]["monkey_false"]]["items"], new)
            end
            popfirst!(monkeys[monkey]["items"])
        end
    end
end

monkeys_times

part2 = reduce(*,sort(collect(values(monkeys_times)))[(end-1):end])


