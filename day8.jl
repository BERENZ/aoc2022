## read mat

function read_and_count(fname)
    m = readlines(fname)
    m = join(join.(split.(m, ""), ','),'\n')
    m = readdlm(IOBuffer(m), ',', Int)
    
    nrows, ncols = size(m)
    
    counter = (nrows+ncols)*2-4
    
    for i in 2:(nrows-1)
        for j in 2:(ncols-1)
            left = all(m[i, 1:(j-1)] .< m[i,j])
            right = all(m[i, (j+1):end] .< m[i,j])
            top = all(m[1:(i-1), j] .< m[i,j])
            bottom =  all(m[(i+1):end, j] .< m[i,j])
            counter += any([left, right, top, bottom])  
        end
    end
    
    return counter
end

read_and_count("data/input8-example.txt")
read_and_count("data/input8.txt")

## part 2
function read_and_count_scenic(fname)
    m = readlines(fname)
    m = join(join.(split.(m, ""), ','),'\n')
    m = readdlm(IOBuffer(m), ',', Int)
    
    nrows, ncols = size(m)
    
    scenic = []
    
    for i in 2:(nrows-1)
        for j in 2:(ncols-1)

            left = reverse(m[i, 1:(j-1)] .>= m[i,j])
            right = m[i, (j+1):end] .>= m[i,j]
            top = reverse(m[1:(i-1), j] .>= m[i,j])
            bottom =  m[(i+1):end, j] .>= m[i,j]

            left_score = findfirst(==(1), left)
            left_score = isnothing(left_score) ? length(left) : left_score
            right_score = findfirst(==(1), right)
            right_score = isnothing(right_score) ? length(right) : right_score
            top_score = findfirst(==(1), top)
            top_score = isnothing(top_score) ? length(top) : top_score
            bottom_score = findfirst(==(1), bottom)
            bottom_score = isnothing(bottom_score) ? length(bottom) : bottom_score


            total_score = [left_score, right_score, top_score, bottom_score]

            push!(scenic, copy(reduce(*,total_score)))
        end
    end
    
    return maximum(scenic)
end

read_and_count_scenic("data/input8-example.txt")
read_and_count_scenic("data/input8.txt")



