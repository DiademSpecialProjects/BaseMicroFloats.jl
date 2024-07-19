struct SimpleFloat{BitWidth, Precision} <:  AbstractSimpleFloat{BitWidth, Precision}
    values::Vector{μValue}
    codings::Vector{μEncode}
end

function SimpleFloat(bitwidth, precision)
    values = map(μValue, construct_SimpleFloat(bitwidth, precision))
    codings = map(μEncode, 0:2^(bitwidth-1))
    SimpleFloat{bitwidth, precision}(values, codings)
end
