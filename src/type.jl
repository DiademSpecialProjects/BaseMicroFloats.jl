
abstract type SimpleMicroFloat{BitWidth, Precision} <: AbstractBinaryFloat{BitWidth, Precision} end

struct SimpleFloat{BitWidth, Precision} <:  SimpleMicroFloat{BitWidth, Precision}
    values::Vector{μValue}
    codings::Vector{μEncode}
end
