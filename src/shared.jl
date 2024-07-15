abstract type AbstractBinaryFloat{BitWidth, Precision} <: AbstractFloat end

const ABF{W, P} = AbstractBinaryFloat{W, P} # AbstractBinaryFloat{Bitwidth, Precision}

nvalues(nbits) = 2^abs(nbits)
bitsof(::Type{AbstractBinaryFloat{BitWidth, Precision}) = BitWidth
  
Base.length(::Type{AbstractBinaryFloat{BitWidth, Precision}) = BitWidth
Base.precision(::Type{AbstractBinaryFloat{BitWidth, Precision}) = Precision

Base.exponent_bits(::Type{AbstractBinaryFloat{BitWidth, Precision}) = BitWidth - Precision
Base.significand_bits(::Type{AbstractBinaryFloat{BitWidth, Precision}) = Precision - 1

Base.isbitstype(::Type{AbstractBinaryFloat{BitWidth, Precision}) = true

bitwidth(::Type{AbstractBinaryFloat{BitWidth, Precision}) = BitWidth
fraction_bits(::Type{AbstractBinaryFloat{BitWidth, Precision}) = Precision - 1

  
