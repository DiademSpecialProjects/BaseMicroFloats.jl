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

struct SimpleFloat{Bits, Prec} <: AkoSimpleMicroFloat{Bits, Prec}
    code::C where {C<:Union{UInt8, UInt16}}
    value::V where {V<:Union{Float32, Float64}}

    function SimpleFloat{Bits, Prec}(code::T, value::Real) where {T<:Union{UInt8, UInt16}}
        V = T == UInt8 ? Float32 : Float64
        return new{Bits, Prec}(code, T(value))
    end
end
