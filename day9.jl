mat = zeros(Int, 50, 50)
moves = readdlm("data/input9-example.txt", ' ')

init_state = view(mat, 50, 1)
fill!(init_state, 1)

for move in 1:size(moves)[1]
    direction = moves[move, 1]
    steps = moves[move, 2]
    for step in 1:steps

    end
end


 