abstract type AkoSimpleMicroFloat{BitWidth, Precision} <: AbstractMicroFloat{BitWidth, Precision} end

struct SimpleMicroFloat{Bits, Prec} <: AkoSimpleMicroFloat{Bits, Prec}
    encoding::Vector{T} where {T<:Union{UInt8, UInt16}}
    values::Vector{T} where {T<:Union{Float32, Float64}}

    function SimpleMicroFloat(Bits, Prec)
        encoding = SMF_encoding(Bits, Prec)
        values = SMF_values(Bits, Prec)
        new{Bits, Prec}(encoding, values)
    end
end

encoding(x::SimpleMicroFloat) = x.encoding
Base.values(x::SimpleMicroFloat) = x.values

bitwidth(::Type{SimpleMicroFloat{Bitwidth, Precision}}) where {Bitwidth, Precision} = Bitwidth
Base.precision(::Type{SimpleMicroFloat{Bitwidth, Precision}}) where {Bitwidth, Precision} = Precision

bitwidth(x::SimpleMicroFloat{Bitwidth, Precision}) where {Bitwidth, Precision} = bitwidth(typeof(x))
Base.precision(x::SimpleMicroFloat{Bitwidth, Precision}) where {Bitwidth, Precision} = precision(typeof(x))

