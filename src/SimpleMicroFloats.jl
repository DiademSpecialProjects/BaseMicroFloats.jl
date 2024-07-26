#=
   confirm isbitstype
=#

module SimpleMicroFloats

export AbstractMicroFloat, AkoSimpleMicroFloat, 
       SimpleMicroFloat,
       bitwidth, precision,
       encoding, values, code, value,
       consistent_rationals

abstract type AbstractMicroFloat{BitWidth, Precision}  <: AbstractFloat end

include("construct.jl")
include("type.jl")

include("aqua.jl")

end  # SimpleMicroFloats
