using BaseMicroFloats, Test

const FLOAT = Union{Float64, Float32, Float16}

MF11 = BaseMicroFloat(1,1);
MF21 = BaseMicroFloat(2,1);
MF22 = BaseMicroFloat(2,2);
MF31 = BaseMicroFloat(3,1);
MF32 = BaseMicroFloat(3,2);
MF33 = BaseMicroFloat(3,3);
MF41 = BaseMicroFloat(4,1);
MF42 = BaseMicroFloat(4,2);
MF43 = BaseMicroFloat(4,3);
MF44 = BaseMicroFloat(4,4);
MF51 = BaseMicroFloat(5,1);
MF52 = BaseMicroFloat(5,2);
MF53 = BaseMicroFloat(5,3);
MF54 = BaseMicroFloat(5,4);
MF55 = BaseMicroFloat(5,5);
MF61 = BaseMicroFloat(6,1);
MF62 = BaseMicroFloat(6,2);
MF63 = BaseMicroFloat(6,3);
MF64 = BaseMicroFloat(6,4);
MF65 = BaseMicroFloat(6,5);
MF66 = BaseMicroFloat(6,6);
MF71 = BaseMicroFloat(7,1);
MF72 = BaseMicroFloat(7,2);
MF73 = BaseMicroFloat(7,3);
MF74 = BaseMicroFloat(7,4);
MF75 = BaseMicroFloat(7,5);
MF76 = BaseMicroFloat(7,6);
MF77 = BaseMicroFloat(7,7);
MF81 = BaseMicroFloat(8,1);
MF82 = BaseMicroFloat(8,2);
MF83 = BaseMicroFloat(8,3);
MF84 = BaseMicroFloat(8,4);
MF85 = BaseMicroFloat(8,5);
MF86 = BaseMicroFloat(8,6);
MF87 = BaseMicroFloat(8,7);

M11 = values(MF11);
M21 = values(MF21);
M22 = values(MF22);
M31 = values(MF31);
M32 = values(MF32);
M33 = values(MF33);
M41 = values(MF41);
M42 = values(MF42);
M43 = values(MF43);
M44 = values(MF44);
M51 = values(MF51);
M52 = values(MF52);
M53 = values(MF53);
M54 = values(MF54);
M55 = values(MF55);
M61 = values(MF61);
M62 = values(MF62);
M63 = values(MF63);
M64 = values(MF64);
M65 = values(MF65);
M66 = values(MF66);
M71 = values(MF71);
M72 = values(MF72);
M73 = values(MF73);
M74 = values(MF74);
M75 = values(MF75);
M76 = values(MF76);
M77 = values(MF77);

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

  
  
  
