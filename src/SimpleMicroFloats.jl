module SimpleMicroFloats

export AbstractBinaryFloat, BitWidth, Precision, ExpBits, FracBits, n_values,    # import all of these
    SimpleMicroFloat

include("shared.jl")

include("type.jl")
include("model.jl")
include("construct.jl")

end  # SimpleMicroFloats
