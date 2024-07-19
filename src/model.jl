function SimpleFloatModel(bitwidth, precision)
    n_values = 2^bitwidth

    n_sign_bits = 0
    n_sign_values = 2 * n_sign_bits

    n_exponent_bits = bitwidth - precision + 1
    n_exponent_values = 2^n_exponent_bits
    n_exponent_cycles = cld(n_values, n_exponent_values)

    n_fraction_bits = bitwidth - n_exponent_bits - n_sign_bits 
    n_fraction_values = 2^n_fraction_bits
    n_fraction_cycles = cld(n_values, n_fraction_values)

    (; bitwidth, precision, n_values, n_sign_bits, n_exponent_bits, n_fraction_bits,
                            n_sign_values, n_exponent_values, n_fraction_values,
                            n_exponent_cycles, n_fraction_cycles)
end

#=
n_fraction_cycles * n_fraction_values == n_exponent_cycles * n_exponent_values == n_values

n_fraction_values == n_exponent_cycles
n_fraction_cycles == n_exponent_values
=#

min_raw_exponent = 0
max_raw_exponent = n_exponent_values - 1
raw_exponent_sequence = min_raw_exponent:max_raw_exponent
bias = 2^(n_exponent_values-1)
biased_exponent_sequence = raw_exponent_sequence .- bias
exponent_sequence = 2.0 .^ biased_exponent_sequence
