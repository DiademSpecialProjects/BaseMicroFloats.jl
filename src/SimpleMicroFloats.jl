#=
   confirm isbitstype
=#

module SimpleMicroFloats

export AbstractBinaryFloat, bitwidth, fraction_bits, nvalues, bitsof,  # import all of these
       SimpleMicroFloat, μEncode, μValue, μSafeEncode, μSafeValue

import Base: precision, exponent_bits, significand_bits, isbitstype

include("shared.jl")

include("type.jl")
include("model.jl")
include("construct.jl")

end  # SimpleMicroFloats
