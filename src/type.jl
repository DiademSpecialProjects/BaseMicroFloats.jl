struct SimpleMicroFloat{BitWidth, Precision} <:  AbstractSimpleFloat{BitWidth, Precision}
    values::Vector{μValue}
    codings::Vector{μEncode}
end

function SimpleMicroFloat(bitwidth, precision)
    values = map(μValue, construct_SimpleFloat(bitwidth, precision))
    codings = map(μEncode, 0:((2^bitwidth)-1))
    SimpleMicroFloat{bitwidth, precision}(values, codings)
end

struct SimpleFloat{BitWidth, Precision} <: AbstractSimpleFloat{BitWidth, Precision}
    value::μValue
    coding::μEncode
end

