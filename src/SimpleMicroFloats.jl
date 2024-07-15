module SimpleMicroFloats

export AbstractBinaryFloat, bitwidth, precision, expbits, fracbits, signbits, nvalues,    # import all of these
    SimpleMicroFloat

import Base: precision, exponent_bits, significand_bits

include("shared.jl")

include("type.jl")
include("model.jl")
include("construct.jl")

end  # SimpleMicroFloats
