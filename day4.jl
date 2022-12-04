## day 4
## example
input = "data/input4.txt"

example = "2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8"

df = CSV.read(IOBuffer(example), DataFrame; header=["a", "b"], types = [String, String]) 
df.a = eval.(Meta.parse.(replace.(df.a, "-" => ":")))
df.b = eval.(Meta.parse.(replace.(df.b, "-" => ":")))
df.check_ab = issubset.(df.a, df.b)
df.check_ba = issubset.(df.b, df.a)
df.flag = df.check_ab .| df.check_ba
sum(df.flag)

## 
df_full = CSV.read(input, DataFrame; header=["a", "b"], types = [String, String]) 
df_full.a = eval.(Meta.parse.(replace.(df_full.a, "-" => ":")))
df_full.b = eval.(Meta.parse.(replace.(df_full.b, "-" => ":")))
df_full.check_ab = issubset.(df_full.a, df_full.b)
df_full.check_ba = issubset.(df_full.b, df_full.a)
df_full.flag = df_full.check_ab .| df_full.check_ba
sum(df_full.flag)

## part 2
df_full.check_inter = length.(intersect.(df_full.a, df_full.b)) .>0
sum(df_full.check_inter)
