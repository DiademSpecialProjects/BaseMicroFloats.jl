using BaseMicroFloats, Test

SMF32 = BaseMicroFloat(3, 2);

@test typeof(encoding(SMF32)[1]) == UInt8
@test typeof(values(SMF32)[1]) == Float32

@test encoding(SMF32) == [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]
@test values(SMF32) == [0.0, 0.25, 0.5, 0.75, 1.0, 1.5, 2.0, 3.0]

SMF98 = BaseMicroFloat(9, 8);

@test typeof(encoding(SMF98)[1]) == UInt16
@test typeof(values(SMF98)[1]) == Float64

