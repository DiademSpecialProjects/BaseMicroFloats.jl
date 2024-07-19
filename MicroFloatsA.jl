### A Pluto.jl notebook ###
# v0.19.45

using Markdown
using InteractiveUtils

# ╔═╡ e9773000-4574-11ef-01d4-3b4fe65c74de
# tests for SimpleFloats

# ╔═╡ 77bd38a8-3e7f-4312-85bf-2d260bde0c38
abstract type AbstractMicroFloat{BitWidth, Precision}  <: AbstractFloat end

# ╔═╡ 69f0c8fd-34b1-4422-b610-1955d17914b1
abstract type AbstractSimpleFloat{BitWidth, Precision} <: AbstractMicroFloat{BitWidth, Precision} end

# const concrete types

# ╔═╡ 6b2722df-2827-4f04-baa9-9026c5f67ee8
const μInt = Base.Int64

# ╔═╡ ffaec94b-8620-492c-952a-b3f140575f41
const μEncode = Base.UInt8

# ╔═╡ 35470a9a-50d9-4d69-8961-131d64628425
const μValue  = Base.Float32

# ╔═╡ 45f58542-dac4-4e3e-8d69-a18146a15c28
const μRational = Rational{μInt}

# ╔═╡ 69455ffe-cde7-4728-bd44-d245b2e5fe78
const μSafeEncode = widen(μEncode)

# ╔═╡ a6ccc428-8b1b-460e-b1b7-ce5865eb3339
const μSafeValue  = widen(μValue)

# ╔═╡ 0ea0cf88-7953-4316-bfcb-c400b47eeecd
const μSafeInt = sizeof(μInt) < 16 ? widen(μInt) : μInt

# ╔═╡ 4f569308-b84d-4e9f-82a1-8125bee4b38b
const μSafeRational = Rational{μSafeInt}

# low level support functions

# ╔═╡ ce900b0b-befb-406c-b635-dcdbd512de7c
nvalues(nbits) = 2^abs(nbits)

# ╔═╡ bc7b2aa9-7eb3-4068-964d-742740054901
function n_exact_cycles(many, few) 
    cycles, partials = divren(many, few)
    if !iszero(partials)
        throw(DomainError("rem($many, $few) is nonzero"))
    end
    cycles
end

# ╔═╡ 94d2c354-32cb-41d7-9afc-d9738dd0b42d
bitsof(::Type{T}) where {T} = 8 * sizeof(T)

# ╔═╡ e37ab94a-5218-495e-8eab-1bddc929dc6e
bitsof(x::T) where {T} = bitsof(T)

# ╔═╡ 47c589b9-ab30-4982-8b1e-4904730659d7
bitsof(T::Type{AbstractMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = 8 * sizeof(T)

# ╔═╡ f75efcc5-e175-437b-b327-324e28660586
bitsof(x::AbstractMicroFloat{BitWidth, Precision}) where {BitWidth, Precision} = 8 * sizeof(x)

# ╔═╡ 81b59e43-52ae-41b8-8664-97173f26228b
struct SimpleFloat{BitWidth, Precision} <:  AbstractSimpleFloat{BitWidth, Precision}
    values::Vector{μValue}
    codings::Vector{μEncode}
end

# ╔═╡ 85976a81-eda0-4147-b345-ecaf449e1283
n_bits(::Type{AbstractMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = BitWidth

# ╔═╡ 86730d46-07a3-464e-95bd-d6dea5902104
n_sign_bits(::Type{SimpleFloat{BitWidth, Precision}}) where {BitWidth, Precision} = 0

# ╔═╡ 7fc6be9e-1fca-48e5-8826-f14440b13daf
n_exponent_bits(::Type{SimpleFloat{BitWidth, Precision}}) where {BitWidth, Precision} = BitWidth - Precision + 1

# ╔═╡ c5f3bbb7-a740-460e-bac0-247be4bdce6e
n_fraction_bits(::Type{AbstractMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = Precision - 1

# ╔═╡ 0ee7dfc9-953a-4d81-a38b-4c4b59061a19
for F in (:n_bits, :n_sign_bits, :n_exponent_bits, :n_fraction_bits)
     @eval $F(x::SimpleFloat{BitWidth, Precision}) where {BitWidth, Precision} = $F(typeof(x))
end

# ╔═╡ 7fc6e640-c77b-43e8-95eb-78ec2c82c4a1
function SimpleFloatModel(bitwidth, precision)
    n_values = 2^bitwidth

    n_sign_bits = 0
    n_sign_values = 2 * n_sign_bits

    n_exponent_bits = bitwidth - precision + 1
    n_exponent_values = 2^n_exponent_bits
    n_exponent_cycles = cld(n_values, n_exponent_values)

    n_fraction_bits = bitwidth - n_exponent_bits - n_sign_bits 
    n_fraction_values = 2^n_fraction_bits
    n_fraction_cycles = cld(n_values, n_fraction_values)

    (; bitwidth, precision, n_values, n_sign_bits, n_exponent_bits, n_fraction_bits,
                            n_sign_values, n_exponent_values, n_fraction_values,
                            n_exponent_cycles, n_fraction_cycles)
end


# ╔═╡ 61ff62f3-b843-424b-9072-ad36b4c1c6f4


# ╔═╡ Cell order:
# ╠═e9773000-4574-11ef-01d4-3b4fe65c74de
# ╠═77bd38a8-3e7f-4312-85bf-2d260bde0c38
# ╠═69f0c8fd-34b1-4422-b610-1955d17914b1
# ╠═6b2722df-2827-4f04-baa9-9026c5f67ee8
# ╠═ffaec94b-8620-492c-952a-b3f140575f41
# ╠═35470a9a-50d9-4d69-8961-131d64628425
# ╠═45f58542-dac4-4e3e-8d69-a18146a15c28
# ╠═69455ffe-cde7-4728-bd44-d245b2e5fe78
# ╠═a6ccc428-8b1b-460e-b1b7-ce5865eb3339
# ╠═0ea0cf88-7953-4316-bfcb-c400b47eeecd
# ╠═4f569308-b84d-4e9f-82a1-8125bee4b38b
# ╠═ce900b0b-befb-406c-b635-dcdbd512de7c
# ╠═bc7b2aa9-7eb3-4068-964d-742740054901
# ╠═94d2c354-32cb-41d7-9afc-d9738dd0b42d
# ╠═e37ab94a-5218-495e-8eab-1bddc929dc6e
# ╠═47c589b9-ab30-4982-8b1e-4904730659d7
# ╠═f75efcc5-e175-437b-b327-324e28660586
# ╠═81b59e43-52ae-41b8-8664-97173f26228b
# ╠═85976a81-eda0-4147-b345-ecaf449e1283
# ╠═86730d46-07a3-464e-95bd-d6dea5902104
# ╠═7fc6be9e-1fca-48e5-8826-f14440b13daf
# ╠═c5f3bbb7-a740-460e-bac0-247be4bdce6e
# ╠═0ee7dfc9-953a-4d81-a38b-4c4b59061a19
# ╠═7fc6e640-c77b-43e8-95eb-78ec2c82c4a1
# ╠═61ff62f3-b843-424b-9072-ad36b4c1c6f4
