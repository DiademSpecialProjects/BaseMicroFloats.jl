# BaseMicroFloats.jl
### The internal constructive model for MicroFloats.
##### Copyright 2024 by Jeffrey Sarnoff

[![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)  [![JET](https://img.shields.io/badge/%F0%9F%9B%A9%EF%B8%8F_tested_with-JET.jl-233f9a)](https://github.com/aviatesk/JET.jl)

----

BaseMicroFloats.jl provides the concrete type `BaseMicroFloat`, with the parameters `Bitwidth` and `Precision`.
- const SMF32 = BaseMicroFloat(3, 2) # Bitwidth = 3, Precision = 2
- const SMF108 = BaseMicroFloat(10, 8) # Bitwidth = 10, Precision = 8

#### The parameters are available
- SMF32bitwidth = bitwidth(SMF32)
- SMF32precision = precision(SMF32)

A `BaseMicroFloat` contains two fields, `encoding` and `values`.
- `encoding` holds the sequence of value encodings for the specified Bitwidth and Precision
- `values` holds the sequence floating-point values  for the specified Bitwidth and Precision

#### The fields are available
- SMF32encoding = encoding(SMF32)
- SMF32values = values(SMF32)

### Technical Notes

#### BaseMicroFloats are used to construct other MicroFloat types
- they are not intended for direct use
  - see UnsignedMicroFloats.jl
  - see SignedMicroFloats.jl

#### The values of a BaseMicroFloat are finite non-negative numbers:
- there is one 0
- there are no negative values
- there are no NaNs
- there are no Infs

#### Types used
```
if the Bitwidth is <= 8
    the encoding is a vector of UInt8
    the values are a vector of Float32
else
    the encoding is a vector of UInt16
    the values are a vector of Float64
end
```

### example
```
using BaseMicroFloat

SMF32 = BaseMicroFloat(3, 2);

bitwidth(SMF32)
# 3

precision(SMF32)
# 2

encoding(SMF32)
# [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]

values(SMF32)
# [0.0, 0.25, 0.5, 0.75, 1.0, 1.5, 2.0, 3.0]
```
