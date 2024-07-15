# AbstractBinaryFloat, MemBits, ExpBits, SigBits, n_values,
abstract type AbstractBinaryFloat{BitWidth, Precision} <: AbstractFloat end

const ABF{W, P} = AbstractBinaryFloat{W, P} # AbstractBinaryFloat{Bitwidth, Precision}

nvalues(nbits) = 2^abs(nbits)

bitwidth(::Type{AbstractBinaryFloat{BitWidth, Precision}) = BitWidth
Base.precision(::Type{AbstractBinaryFloat{BitWidth, Precision}) = Precision

expbits(::Type{AbstractBinaryFloat{BitWidth, Precision}) = BitWidth - Precision
fracbits(::Type{AbstractBinaryFloat{BitWidth, Precision}) = Precision - 1
  
