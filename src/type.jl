
abstract type AkoSimpleMicroFloat{BitWidth, Precision} <: AbstractBinaryFloat{BitWidth, Precision} end

struct SimpleMicroFloat{BitWidth, Precision} <:  AkoSimpleMicroFloat{BitWidth, Precision}
    values::Vector{μValue}
    codings::Vector{μEncode}
end
