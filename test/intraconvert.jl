using BaseMicroFloats, Test

const FLOAT = Union{Float64, Float32, Float16}

MF31 = BaseMicroFloat(3,1);
MF32 = BaseMicroFloat(3,2);
MF41 = BaseMicroFloat(4,1);
MF42 = BaseMicroFloat(4,2);
MF43 = BaseMicroFloat(4,3);
MF51 = BaseMicroFloat(5,1);
MF52 = BaseMicroFloat(5,2);
MF53 = BaseMicroFloat(5,3);
MF54 = BaseMicroFloat(5,4);
MF61 = BaseMicroFloat(6,1);
MF62 = BaseMicroFloat(6,2);
MF63 = BaseMicroFloat(6,3);
MF64 = BaseMicroFloat(6,4);
MF65 = BaseMicroFloat(6,5);

M32idx3 = values(MF32)[3];
M32idx4 = values(MF52)[4];
M32idx5 = values(MF32)[5];

M53idx25 = values(MF53)[25];
M53idx26 = values(MF53)[26];
M53idx27 = values(MF53)[27];

M63idx46 = values(MF63)[46];
M63idx47 = values(MF63)[47];
M63idx48 = values(MF63)[48];

function mfvalue_to_offset(x::T, idx)  where {K,P,T<:BaseMicroFloat{K,P}}
     val = values(x)[idx]
     nvals = nvalues(T)
     nfracs = nfractions(T)
     nexps = nexponents(T)
     nfraccycles = nfractioncycles(T)
     nexpcycles = nexponentcycles(T)

     fr, xp = frexp(val)
     frT = typeof(fr)

     expfield = exponent_field(val)
     expfieldivalue = exponent_field_ivalue(val)
     expfieldcorrected = exponent_field_corrected_ivalue(K, P, val)
     fracfieldivalue = fraction_field_ivalue(val)

     (; value=(;val,fr,xp), nfracs, nexps, nfraccycles, nexpcycles, expfieldivalue, expfieldcorrected, fracfieldivalue)
end

exponent_field(x::T) where {T<:FLOAT} =
    reinterpret(Unsigned, x) & Base.exponent_mask(T)

exponent_field_ivalue(x::T) where {T<:FLOAT} =
    exponent_field(x) >> Base.significand_bits(T)

fraction_field_ivalue(x::T) where {T<:FLOAT} =
    reinterpret(Unsigned, x) & Base.significand_mask(T)

fraction_field_ivalue(K, P, x::T) where {T<:FLOAT} =
    fraction_field_ivalue(x) >> (Base.precision(T) - P)

exponent_field_ivalue(K, P, x::T) where {T<:FLOAT} =
    (exponent_field_ivalue(x) >> (Base.exponent_bits(T) - P))

exponent_field_corrected_ivalue(K, P, x::T) where {T<:FLOAT} = 
    1 << 2^(exponent_field_ivalue(x) - Base.exponent_bias(T))

  
  
  
