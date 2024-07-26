#=
   confirm isbitstype
=#

module SimpleMicroFloats

export AbstractMicroFloat, AkoSimpleMicroFloat, 
       SimpleMicroFloat, SimpleFloat

include("shared.jl")

include("type.jl")
include("construct.jl")

include("aqua.jl")

end  # SimpleMicroFloats
