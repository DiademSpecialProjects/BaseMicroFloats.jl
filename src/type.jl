struct SimpleMicroFloat{BitWidth, Prec} <: AkoSimpleMicroFloat{BitWidth, Prec}
    encoding::Vector{T} where {T<:Union{UInt8, UInt16}}
    values::Vector{T} where {T<:Union{Float32, Float64}}

    function SimpleMicroFloat(BitWidth, Prec)
        encoding = AMF_encoding(BitWidth, Prec)
        values = AMF_values(BitWidth, Prec)
        new{BitWidth, Prec}(encoding, values)
    end
end

encoding(x::SimpleMicroFloat) = x.encoding
Base.values(x::SimpleMicroFloat) = x.values

bitwidth(::Type{SimpleMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = BitWidth
Base.precision(::Type{SimpleMicroFloat{BitWidth, Precision}}) where {BitWidth, Precision} = Precision

bitwidth(x::SimpleMicroFloat{BitWidth, Precision}) where {BitWidth, Precision} = bitwidth(typeof(x))
Base.precision(x::SimpleMicroFloat{BitWidth, Precision}) where {BitWidth, Precision} = precision(typeof(x))

