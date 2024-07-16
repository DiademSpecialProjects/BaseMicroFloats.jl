#=
   confirm isbitstype
=#

module SimpleMicroFloats

export AbstractMicroFloat, 
       n_bits, n_sign_bits, n_exponent_bits, n_fraction_bits,
       n_values, n_sign_values, n_exponent_values, n_fraction_values, 
       μEncode, μValue, μSafeEncode, μSafeValue,
       SimpleMicroFloat

include("shared.jl")

include("type.jl")
include("model.jl")
include("construct.jl")

include("aqua.jl")

end  # SimpleMicroFloats
