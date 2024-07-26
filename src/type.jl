abstract type AkoSimpleMicroFloat{BitWidth, Precision} <: AbstractMicroFloat{BitWidth, Precision} end

struct SimpleMicroFloat{Bits, Prec} <: AkoSimpleMicroFloat{Bits, Prec}
    encoding::Vector{T} where {T<:Union{UInt8, UInt16}}
    values::Vector{T} where {T<:Union{Float32, Float64}}

    function SimpleMicroFloat(Bits, Prec)
        encoding = SimpleFloat_encoding(Bits, Prec)
        values = SimpleFloat_values(Bits, Prec)
        new{Bits, Prec}(encoding, values)
    end
end

encoding(x::SimpleMicroFloat) = x.encoding
Base.values(x::SimpleMicroFloat) = x.values

bitwidth(::Type{SimpleMicroFloat{Bitwidth, Precision}}) where {Bitwidth, Precision} = Bitwidth
precision(::Type{SimpleMicroFloat{Bitwidth, Precision}}) where {Bitwidth, Precision} = Precision

bitwidth(x::SimpleMicroFloat{Bitwidth, Precision}) where {Bitwidth, Precision} = bitwidth(typeof(x))
precision(x::SimpleMicroFloat{Bitwidth, Precision}) where {Bitwidth, Precision} = precision(typeof(x))

struct SimpleFloat{Bits, Prec} <: AkoSimpleMicroFloat{Bits, Prec}
    code::C where {C<:Union{UInt8, UInt16}}
    value::V where {V<:Union{Float32, Float64}}

    function SimpleFloat{Bits, Prec}(code::UInt8, value::Float32) where {Bits, Prec}
        return new{Bits,Prec}(code, value)
    end

    function SimpleFloat{Bits, Prec}(code::UInt16, value::Float64) where {Bits, Prec}
        return new{Bits,Prec}(code, value)
    end
end

code(x::SimpleMicroFloat) = x.code
value(x::SimpleMicroFloat) = x.value

bitwidth(::Type{SimpleFloat{Bitwidth, Precision}}) where {Bitwidth, Precision} = Bitwidth
precision(::Type{SimpleFloat{Bitwidth, Precision}}) where {Bitwidth, Precision} = Precision

bitwidth(x::SimpleFloat{Bitwidth, Precision}) where {Bitwidth, Precision} = bitwidth(typeof(x))
precision(x::SimpleFloat{Bitwidth, Precision}) where {Bitwidth, Precision} = precision(typeof(x))

#=
SMF21 = SimpleMicroFloat(2, 1)

smf21_0 = SimpleFloat{bitwidth(SMF21), precision(SMF21)}(0x00, 0.0f0)
=#
