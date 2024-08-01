struct SimpleMicroFloat{Bitwidth, Precision} <: AkoSimpleMicroFloat{Bitwidth, Precision}
    encoding::Vector{T} where {T<:Union{UInt8, UInt16}}
    values::Vector{T} where {T<:Union{Float32, Float64}}

    function SimpleMicroFloat(Bitwidth, Precision)
        encoding = AMF_encoding(Bitwidth, Precision)
        values = AMF_values(Bitwidth, Precision)
        new{Bitwidth, Precision}(encoding, values)
    end
end

encoding(x::SimpleMicroFloat) = x.encoding
Base.values(x::SimpleMicroFloat) = x.values

bitwidth(::Type{SimpleMicroFloat{Bitwidth, Precision}}) where {Bitwidth, Precision} = Bitwidth
Base.precision(::Type{SimpleMicroFloat{Bitwidth, Precision}}) where {Bitwidth, Precision} = Precision

bitwidth(x::SimpleMicroFloat{Bitwidth, Precision}) where {Bitwidth, Precision} = bitwidth(typeof(x))
Base.precision(x::SimpleMicroFloat{Bitwidth, Precision}) where {Bitwidth, Precision} = precision(typeof(x))

nbits(::Type{SimpleMicroFloat{Bitwidth, Precision}}) where {Bitwidth, Precision} = Bitwidth
nfractionbits(::Type{SimpleMicroFloat{Bitwidth, Precision}}) where {Bitwidth, Precision} = Precision - 1
nexponentbits(::Type{SimpleMicroFloat{Bitwidth, Precision}}) where {Bitwidth, Precision} = Bitwidth - Precision + 1
nvalues(::Type{T}) where {Bitwidth, Precision, T<:SimpleMicroFloat{Bitwidth, Precision}} = 2^nbits(T)
nfractionvalues(::Type{T}) where {Bitwidth, Precision, T<:SimpleMicroFloat{Bitwidth, Precision}} = 2^nfractionbits(T)
nexponentvalues(::Type{T}) where {Bitwidth, Precision, T<:SimpleMicroFloat{Bitwidth, Precision}} = 2^nexponentbits(T)

for F in (:nbits, :nfractionbits, :nexponentbits, :nvalues, :nfractionvalues, :nexponentvalues)
    @eval $F(x::T) where {T<:SimpleMicroFloat} = $F(T)
end
