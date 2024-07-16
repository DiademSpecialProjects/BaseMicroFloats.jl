abstract type AbstractMicroFloat{BitWidth, Precision}  <: AbstractFloat end
abstract type AbstractSimpleFloat{BitWidth, Precision} <: AbstractMicroFloat{BitWidth, Precision} end

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

function n_exact_cycles(many, few) 
    cycles, partials = divren(many, few)
    if !iszero(partials)
        throw(DomainError("rem($many, $few) is nonzero"))
    end
    cycles
end

bitsof(::Type{T}) where {T} = 8 * sizeof(T)
bitsof(x::T) where {T} = bitsof(T)

bitsof(T::Type{AbstractMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = 8 * sizeof(T)
bitsof(x::AbstractMicroFloat{BitWidth, Precision}) where {BitWidth, Precision} = 8 * sizeof(x)


  
