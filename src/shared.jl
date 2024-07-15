# AbstractBinaryFloat, MemBits, ExpBits, SigBits, n_values,
abstract type AbstractBinaryFloat{BitWidth, Precision} <: AbstractFloat end

const ABF{W, P} = AbstractBinaryFloat{W, P} # AbstractBinaryFloat{Bitwidth, Precision}

n_values(nbits) = 2^abs(nbits)

MemBits(::Type{AbstractBinaryFloat{BitWidth, Precision}) = BitWidth
Precision(::Type{AbstractBinaryFloat{BitWidth, Precision}) = Precision

ExpBits(::Type{AbstractBinaryFloat{BitWidth, Precision}) = BitWidth - Precision
FracBits(::Type{AbstractBinaryFloat{BitWidth, Precision}) = Precision - 1
  

