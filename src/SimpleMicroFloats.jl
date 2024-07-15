module SimpleMicroFloats

export AbstractBinaryFloat, bitwidth, nvalues,    # import all of these
       fraction_bits,
       SimpleMicroFloat

import Base: precision, exponent_bits, significand_bits, isbitstype

include("shared.jl")

include("type.jl")
include("model.jl")
include("construct.jl")

end  # SimpleMicroFloats
