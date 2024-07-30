# SimpleMicroFloats.jl
### The internal constructive model for MicroFloats.
##### Copyright 2024 by Jeffrey Sarnoff

[![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)  [![JET](https://img.shields.io/badge/%F0%9F%9B%A9%EF%B8%8F_tested_with-JET.jl-233f9a)](https://github.com/aviatesk/JET.jl)

----

SimpleMicroFloats.jl provides the concrete type `SimpleMicroFloat`, with the parameters `BitWidth` and `Precision`.
- const SMF32 = SimpleMicroFloat(3, 2) # BitWidth = 3, Precision = 2
- const SMF108 = SimpleMicroFloat(10, 8) # BitWidth = 10, Precision = 8

#### The parameters are available
- SMF32bitwidth = bitwidth(SMF32)
- SMF32precision = precision(SMF32)

A `SimpleMicroFloat` contains two fields, `encoding` and `values`.
- `encoding` holds the sequence of value encodings for the specified BitWidth and Precision
- `values` holds the sequence floating-point values  for the specified BitWidth and Precision

#### The fields are available
- SMF32encoding = encoding(SMF32)
- SMF32values = values(SMF32)

### Technical Notes

#### SimpleMicroFloats are used to construct other MicroFloat types
- they are not intended for direct use
  - see UnsignedMicroFloats.jl
  - see SignedMicroFloats.jl

#### The values of a SimpleMicroFloat are finite non-negative numbers:
- there is one 0
- there are no negative values
- there are no NaNs
- there are no Infs

#### Types used
```
if the BitWidth is <= 8
    the encoding is a vector of UInt8
    the values are a vector of Float32
else
    the encoding is a vector of UInt16
    the values are a vector of Float64
end
```

### In Use
```
using SimpleMicroFloat

SMF32 = SimpleMicroFloat(3, 2);

bitwidth(SMF32)
# 3

precision(SMF32)
# 2

encoding(SMF32)
# [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]

values(SMF32)
# [0.0, 0.25, 0.5, 0.75, 1.0, 1.5, 2.0, 3.0]
```
