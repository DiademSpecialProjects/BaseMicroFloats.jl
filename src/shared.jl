abstract type AbstractBinaryFloat{BitWidth, Precision} <: AbstractFloat end

bitwidth(::Type{AbstractBinaryFloat{BitWidth, Precision}) = BitWidth
fraction_bits(::Type{AbstractBinaryFloat{BitWidth, Precision}) = Precision - 1

const ABF{W, P} = AbstractBinaryFloat{W, P} # AbstractBinaryFloat{Bitwidth, Precision}

# const concrete types

const μInt = Base.Int64
const μEncode = Base.UInt8
const μValue  = Base.Float32
const μRational = Rational{μInt}

const μSafeEncode = widen(μEncode)
const μSafeValue  = widen(μValue)
const μSafeInt = sizeof(μInt) < 16 ? widen(μInt) : μInt

const μSafeRational = Rational{μSafeInt}

# from Base
Base.length(::Type{AbstractBinaryFloat{BitWidth, Precision}}) = BitWidth
Base.precision(::Type{AbstractBinaryFloat{BitWidth, Precision}}) = Precision

Base.exponent_bits(::Type{AbstractBinaryFloat{BitWidth, Precision}}) = BitWidth - Precision
Base.significand_bits(::Type{AbstractBinaryFloat{BitWidth, Precision}}) = Precision - 1

Base.isbitstype(::Type{AbstractBinaryFloat{BitWidth, Precision}}) = true

# low level support functions

nvalues(nbits) = 2^abs(nbits)
bitsof(::Type{T}) where {T} = 8 * sizeof(T)
bitsof(x::T) where {T} = bitsof(T)

bitsof(T::Type{AbstractBinaryFloat{BitWidth, Precision}}) where {BitWidth, Precision} = 8 * sizeof(T)
bitsof(x::AbstractBinaryFloat{BitWidth, Precision}) where {BitWidth, Precision} = 8 * sizeof(x)


  
