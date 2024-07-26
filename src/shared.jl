abstract type AbstractMicroFloat{BitWidth, Precision}  <: AbstractFloat end

# low level support functions

n_values(nbits) = 2^abs(nbits)

bitsof(::Type{T}) where {T} = 8 * sizeof(T)
bitsof(x::T) where {T} = bitsof(T)

bitsof(T::Type{AbstractMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = Bitwidth
bitsof(x::AbstractMicroFloat{BitWidth, Precision}) where {BitWidth, Precision} = bitsof(typeof(x))
