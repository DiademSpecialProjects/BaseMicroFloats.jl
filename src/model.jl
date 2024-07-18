function SimpleFloatModel(bitwidth, precision)
    n_values = 2^bitwidth

    n_sign_bits = 0
    n_sign_values = 2 * n_sign_bits

    n_exponent_bits = bitwidth - precision 
    n_exponent_values = 2^n_exponent_bits
    n_exponent_cycles = cld(n_values, n_exponent_values)

    n_fraction_bits = bitwidth - n_exponent_bits - n_sign_bits 
    n_fraction_values = 2^n_fraction_bits
    n_fraction_cycles = cld(n_values, n_fraction_values)

    (; bitwidth, precision, n_values, n_sign_bits, n_exponent_bits, n_fraction_bits,
                            n_sign_values, n_exponent_values, n_fraction_values,
                            n_exponent_cycles, n_fraction_cycles)
end

    