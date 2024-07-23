p3109signed_exponent_bits(bitwidth, precision) = bitwidth - precision
p3109signed_trailing_bits(bitwidth, precision) = precision - 1
p3109signed_exponent_max(bitwidth, precision) = 2^(p3109signed_exponent_bits(bitwidth, precision) - 1) - 1
p3109signed_exponent_min(bitwidth, precision) = SE(bitwidth, precision) - p3109signed_exponent_max(bitwidth, precision)
SE(bitwidth, precision) = precision == 1 ? 1 : 0
p3109signed_exponent_bias(bitwidth, precision) = 1 - p3109signed_exponent_min(bitwidth, precision)

p3109unsigned_exponent_bits(bitwidth, precision) = bitwidth - precision + 1
p3109unsigned_trailing_bits(bitwidth, precision) = precision - 1
p3109unsigned_exponent_max(bitwidth, precision) = 2^(p3109unsigned_exponent_bits(bitwidth, precision) - 1) - 1
p3109unsigned_exponent_min(bitwidth, precision) = SEunsigned(bitwidth, precision) - p3109unsigned_exponent_max(bitwidth, precision)
SEunsigned(bitwidth, precision) = precision == 1 ? 1 : 0
p3109unsigned_exponent_bias(bitwidth, precision) = 1 - p3109unsigned_exponent_min(bitwidth, precision)

# p3109signed_exponent_(8,5) == p3109unsigned_exponent_(7,5)
# p3109signed_trailing_bits(8,5) == p3109unsigned_trailing_bits(8,5)
