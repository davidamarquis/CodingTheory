# Copyright (c) 2022, 2023 Eric Sabo
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

#############################
        # constructors
#############################

"""
    GeneralizedReedSolomonCode(k::Int, v::Vector{fqPolyRepFieldElem}, γ::Vector{fqPolyRepFieldElem})

Return the dimension `k` Generalized Reed-Solomon code with scalars `v` and
evaluation points `γ`.

# Notes
* The vectors `v` and `γ` must have the same length and every element must be over the same field.
* The elements of `v` need not be distinct but must be nonzero.
* The elements of `γ` must be distinct.
"""
function GeneralizedReedSolomonCode(k::Int, v::Vector{fqPolyRepFieldElem}, γ::Vector{fqPolyRepFieldElem})
    n = length(v)
    1 <= k <= n || throw(DomainError("The dimension of the code must be between 1 and n."))
    n == length(γ) || throw(DomainError("Lengths of scalars and evaluation points must be equal."))
    F = base_ring(v[1])
    1 <= n <= Int(order(F)) || throw(DomainError("The length of the code must be between 1 and the order of the field."))
    for (i, x) in enumerate(v)
        iszero(x) && throw(ArgumentError("The elements of v must be nonzero."))
        parent(x) == F || throw(ArgumentError("The elements of v must be over the same field."))
        parent(γ[i]) == F || throw(ArgumentError("The elements of γ must be over the same field as v."))
    end
    length(distinct(γ)) == n || throw(ArgumentError("The elements of γ must be distinct."))

    G = zero_matrix(F, k, n)
    for c in 1:n
        for r in 1:k
            G[r, c] = v[c] * γ[c]^(r - 1)
        end
    end

    # evaluation points are the same for the parity check, but scalars are now
    # w_i = (γ_i * \prod(v_j - v_i))^-1
    # which follows from Lagrange interpolation
    w = zero_matrix(F, 1, n)
    for i in 1:n
        w[i] = (γ[c] * prod(v[j] - v[c] for j = 1:n if j != c))^-1
    end

    H = zero_matrix(F, n - k, n)
    for c in 1:n
        for r in 1:n - k
            H[r, c] = w[c] * γ[c]^(r - 1)
        end
    end

    iszero(G * transpose(H)) || error("Calculation of dual scalars failed in constructor.")
    G_stand, H_stand, P, rnk = _standardform(G)
    d = n - k + 1
    return GeneralizedReedSolomonCode(F, n, k, d, d, d, v, w, γ, G, H,
        G_stand, H_stand, P, missing)
end

#############################
      # getter functions
#############################

"""
    scalars(C::GeneralizedReedSolomonCode)

Return the scalars `v` of the Generalized Reed-Solomon code `C`.
"""
scalars(C::GeneralizedReedSolomonCode) = C.v

"""
    dual_scalars(C::GeneralizedReedSolomonCode)

Return the scalars of the dual of the Generalized Reed-Solomon code `C`.
"""
dual_scalars(C::GeneralizedReedSolomonCode) = C.w

"""
    evaluation_points(C::GeneralizedReedSolomonCode)

Return the evaluation points `γ` of the Generalized Reed-Solomon code `C`.
"""
evaluation_points(C::GeneralizedReedSolomonCode) = C.γ

#############################
      # setter functions
#############################

#############################
     # general functions
#############################

# TODO: write conversion function from Reed-Solomon code to GRS
