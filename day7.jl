
## functions
## pretty dict2 https://stackoverflow.com/questions/48195775/how-to-pretty-print-nested-dicts-in-julia
function pretty_print2(d::Dict, pre=1)

    todo = Vector{Tuple}()
    for (k,v) in d
        if typeof(v) <: Dict
            push!(todo, (k,v))
        else
            println(join(fill(" ", pre)) * "$(repr(k)) => $(repr(v))")
        end
    end

    for (k,d) in todo
        s = "$(repr(k)) => "
        println(join(fill(" ", pre)) * s)
        pretty_print2(d, pre+1+length(s))
    end
    nothing
end
 

function create_dictionary(fname) 

    commands = readlines(fname)
    directory = Dict()
    directory_history = []
    directory_current = ["/"]

    for line in commands

        if contains(line, r"\$ cd ")
            if contains(line, r"\/")
                directory_current = [directory_current[1]]
            elseif contains(line, "..")
                pop!(directory_current);
            else
                current_dir = replace(line, r"\$ cd " => "") 
                push!(directory_current, current_dir)
            end
        end
        
        push!(directory_history, copy(directory_current))

        if length(directory_current) == 1
            current_folder = directory
        else
            temp = copy(directory)
            for f in directory_current[2:end]
                temp=temp[f]
            end
            current_folder = temp
        end
    
        if contains(line, "dir")
            dir_name = replace(line, "dir " => "")
            current_folder[dir_name] = Dict()
        end
        if contains(line, r"\d{1,}")
            file_name = replace(line, r"\d{1,} " => "")
            file_size = parse(Int,match(r"^\d{1,}", line).match)
            current_folder[file_name] = file_size
        end
    end
    directory_history = unique(directory_history)
    map(popfirst!, directory_history)
    return directory, sort(filter(!isempty,directory_history))
end

dict7, hist7 = create_dictionary("data/input7.txt");

sums = zeros(Int, length(hist7))
k = 1
for dir in hist7
    if length(dir) == 1
        vals = collect(values(dict7[dir[1]]))
        vals = filter(x -> typeof(x) == Int64, vals)
        if isempty(vals) 
            k += 1
            continue
        end
        sums[k] = sum(vals)
    else
        temp = copy(dict7)
        for f in dir
            temp=temp[f]
        end
        vals = collect(values(temp))
        vals = filter(x -> typeof(x) == Int64, vals)
        if isempty(vals) 
            k += 1
            continue
        end
        sums[k] = sum(vals)
    end
    k += 1
end


## update sum
## nonzero elements 
res = Dict(hist7 .=> copy(sums))
all_keys = collect(keys(res))
all_keys_1  = filter(x-> length(x) == 1, all_keys)
all_keys_2  = filter(x-> length(x) == 2, all_keys)
all_keys_3  = filter(x-> length(x) == 3, all_keys)
all_keys_4  = filter(x-> length(x) == 4, all_keys)
all_keys_5  = filter(x-> length(x) == 5, all_keys)
all_keys_6  = filter(x-> length(x) == 6, all_keys)
all_keys_7  = filter(x-> length(x) == 7, all_keys)
all_keys_8  = filter(x-> length(x) == 8, all_keys)


for h2 in all_keys_8
    for h1 in all_keys_7
        check = issubset(h1, h2)
        if check
           res[h1] += res[h2]
        end
    end
end


for h2 in all_keys_7
    for h1 in all_keys_6
        check = issubset(h1, h2)
        if check
           res[h1] += res[h2]
        end
    end
end

for h2 in all_keys_6
    for h1 in all_keys_5
        check = issubset(h1, h2)
        if check
           res[h1] += res[h2]
        end
    end
end

for h2 in all_keys_5
    for h1 in all_keys_4
        check = issubset(h1, h2)
        if check
           res[h1] += res[h2]
        end
    end
end

for h2 in all_keys_4
    for h1 in all_keys_3
        check = issubset(h1, h2)
        if check
           res[h1] += res[h2]
        end
    end
end

for h2 in all_keys_3
    for h1 in all_keys_2
        check = issubset(h1, h2)
        if check
           res[h1] += res[h2]
        end
    end
end

for h2 in all_keys_2
    for h1 in all_keys_1
        check = issubset(h1, h2)
        if check
           res[h1] += res[h2]
        end
    end
end

sum(i for i in values(res) if i <= 100000 ) ## 1543140

## part 2
## total space
total_space = 70000000
min_space = 30000000
main_dir = filter(x -> length(x) == 1, collect(keys(res)))
## directories (should be 1117448)
current_space = 23804 + 24936 + 178747  + sum(sums)
space_left  = total_space - current_space
space_required = min_space - space_left
minimum([res[i] for i in all_keys if res[i] >= space_required])
