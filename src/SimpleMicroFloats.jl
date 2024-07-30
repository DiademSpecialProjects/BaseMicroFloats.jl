module SimpleMicroFloats

export AbstractMicroFloat, AkoSimpleMicroFloat, 
       SimpleMicroFloat, 
       bitwidth, precision, encoding, values

abstract type AbstractMicroFloat{BitWidth, Precision}  <: AbstractFloat end
abstract type AkoSimpleMicroFloat{BitWidth, Precision} <: AbstractMicroFloat{BitWidth, Precision} end

include("construct.jl")
include("type.jl")

include("aqua.jl")

end  # SimpleMicroFloats
