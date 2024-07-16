abstract type AbstractMicroFloat{BitWidth, Precision}  <: AbstractFloat end
abstract type AbstractSimpleFloat{BitWidth, Precision} <: AbstractMicroFloat{BitWidth, Precision} end

function n_encoding_bits() end
function n_sign_bits() end
function n_exponent_bits() end
function n_fraction_bits() end

n_encoding_bits(::Type{AbstractMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = BitWidth
n_fraction_bits(::Type{AbstractMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = Precision - 1

n_exponent_bits(::Type{AbstractMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = BitWidth - Precision
n_exponent_bits(::Type{AbstractSimpleFloat{BitWidth, Precision}}) where {BitWidth, Precision} = BitWidth - Precision + 1

n_sign_bits(::Type{AbstractSimpleFloat{BitWidth, Precision}}) where {BitWidth, Precision} = 0

# const concrete types

const μInt = Base.Int64
const μEncode = Base.UInt8
const μValue  = Base.Float32
const μRational = Rational{μInt}

const μSafeEncode = widen(μEncode)
const μSafeValue  = widen(μValue)
const μSafeInt = sizeof(μInt) < 16 ? widen(μInt) : μInt

const μSafeRational = Rational{μSafeInt}

# low level support functions

nvalues(nbits) = 2^abs(nbits)
bitsof(::Type{T}) where {T} = 8 * sizeof(T)
bitsof(x::T) where {T} = bitsof(T)

bitsof(T::Type{AbstractMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = 8 * sizeof(T)
bitsof(x::AbstractMicroFloat{BitWidth, Precision}) where {BitWidth, Precision} = 8 * sizeof(x)


  
