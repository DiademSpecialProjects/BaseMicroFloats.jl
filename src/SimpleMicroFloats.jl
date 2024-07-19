#=
   confirm isbitstype
=#

module SimpleMicroFloats

export AbstractMicroFloat,
       μEncode, μValue, μSafeEncode, μSafeValue,
       SimpleMicroFloat

include("shared.jl")

include("type.jl")
include("model.jl")
include("construct.jl")

include("aqua.jl")

end  # SimpleMicroFloats
