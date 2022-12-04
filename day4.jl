## day 4
## example
input = "data/input4.txt"

example = "2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8"

function check_subset(file, subset=true)
    df = CSV.read(file, DataFrame; header=["a", "b"], types = [String, String]) 
    df.a = eval.(Meta.parse.(replace.(df.a, "-" => ":")))
    df.b = eval.(Meta.parse.(replace.(df.b, "-" => ":")))
    df.check_ab = issubset.(df.a, df.b)
    df.check_ba = issubset.(df.b, df.a)
    df.flag = df.check_ab .| df.check_ba
    df_full.check_inter = length.(intersect.(df_full.a, df_full.b)) .>0

    if subset == true
        return sum(df.flag)
    else
        return sum(df_full.check_inter)
    end
end


check_subset(IOBuffer(example))
check_subset(input)
check_subset(input, false)
