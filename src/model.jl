
function SimpleFloatModel(bitwidth, precision)
    n_values = 2^bitwidth
    values = (; n_values, bitwidth, precision)

    n_exponent_bits = bitwidth - precision 
    n_exponents = 2^n_exponent_bits
    n_cycles = cld(n_values, n_exponents)
    exponents = (; n_exponents, n_cycles)

    n_fraction_bits = precision - 1
    n_fractions = 2^n_fraction_bits
    n_cycles = cld(n_values, n_fractions)
    fractions = (; n_fractions, n_cycles)

    (; values, exponents, fractions)
end

    