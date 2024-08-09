using BaseMicroFloats, Test

BMF32 = BaseMicroFloat(3, 2);

@test typeof(encoding(BMF32)[1]) == UInt8
@test typeof(values(BMF32)[1]) == Float32

@test encoding(BMF32) == [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]
@test values(BMF32) == [0.0, 0.25, 0.5, 0.75, 1.0, 1.5, 2.0, 3.0]

BMF98 = BaseMicroFloat(9, 8);

@test typeof(encoding(BMF98)[1]) == UInt16
@test typeof(values(BMF98)[1]) == Float64

