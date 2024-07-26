#=
   confirm isbitstype
=#

module SimpleMicroFloats

export AbstractMicroFloat, AkoSimpleMicroFloat, 
       SimpleMicroFloat,
       bitwidth, precision,
       encoding, values, code, value,
       consistent_rationals

include("shared.jl")

include("construct.jl")
include("type.jl")
include("show.jl")
include("aqua.jl")

end  # SimpleMicroFloats
