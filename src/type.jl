struct SimpleFloat{BitWidth, Precision} <:  SimpleMicroFloat{BitWidth, Precision}
    values::Vector{μValue}
    codings::Vector{μEncode}
end

n_bits(::Type{AbstractMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = BitWidth
n_sign_bits(::Type{SimpleFloat{BitWidth, Precision}}) where {BitWidth, Precision} = 0
n_exponent_bits(::Type{SimpleFloat{BitWidth, Precision}}) where {BitWidth, Precision} = BitWidth - Precision + 1
n_fraction_bits(::Type{AbstractMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = Precision - 1

for F in (:n_bits, :n_sign_bits, :n_exponent_bits, :n_fraction_bits)
     @eval $F(x::SimpleFloat{BitWidth, Precision}) where {BitWidth, Precision} = $F(typeof(x))
end