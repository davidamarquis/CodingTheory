function showing_func(n)
    for i in 1:n
        @show i^2
        @warn "Not good" i
    end
end

# showing_func(10)

# goal call the _min_wt_col function
# mat=matrix(F, 2, 2, [1, 1, 0, 1])
# _min_wt_col(mat)

# using AbstractAlgebra
using Oscar
R, x = FiniteField(23, 2, "x")

S, y = polynomial_ring(R, "y")

# T, z = GF(2,"z");
# Kx, x = T["x"];
# base_ff, a = GF(x^2+x+1, "a")
# # ext_ff, alpha = extend()
# z=tr(a)
# @show z

# [f1435218] Oscar v0.13.0
# K = GF(9, "a")
# Kx, x = K["x"];
# L = GF(x^3 + x^2 + x + 2, "b")

# using AbstractAlgebra v0.31.1

# mat=matrix(F, 2, 2, [1, 1, 0, 1])
typeof(R)
typeof(x)

# println(ff(5.0, 3.0))
# @edit ff(5.0, 3.0) 

using CodingTheory
do_thing() 