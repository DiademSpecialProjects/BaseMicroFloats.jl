#=
   confirm isbitstype
=#

module SimpleMicroFloats

export AbstractMicroFloat, AkoSimpleMicroFloat, 
       SimpleMicroFloat, SimpleFloat

include("shared.jl")

include("construct.jl")
include("type.jl")

include("aqua.jl")

end  # SimpleMicroFloats
