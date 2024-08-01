module SimpleMicroFloats

export AbstractMicroFloat, AkoSimpleMicroFloat, 
       SimpleMicroFloat, 
       bitwidth, precision, encoding, values,
       nvalues, nfractions, nexponents, nfractioncycles, nexponentcycles

abstract type AbstractMicroFloat{Bitwidth, Precision}  <: AbstractFloat end
abstract type AkoSimpleMicroFloat{Bitwidth, Precision} <: AbstractMicroFloat{Bitwidth, Precision} end

include("construct.jl")
include("type.jl")

include("aqua.jl")

end  # SimpleMicroFloats
