#=
   confirm isbitstype
=#

module SimpleMicroFloats

export AbstractMicroFloat,
       μEncode, μValue, μSafeEncode, μSafeValue,
       SimpleMicroFloat, SimpleFloat

include("P3109.jl")
include("shared.jl")

include("type.jl")
include("model.jl")
include("construct.jl")

include("aqua.jl")

end  # SimpleMicroFloats
