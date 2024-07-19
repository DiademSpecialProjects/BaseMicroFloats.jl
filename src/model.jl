function characterize_SimpleFloat(bitwidth, precision)
    n_values = 2^bitwidth

    n_fraction_bits = precision - 1 
    n_fraction_values = 2^n_fraction_bits
    n_fraction_cycles = div(n_values, n_fraction_values)
    @assert n_fraction_cycles * n_fraction_values == n_values
    
    n_exponent_values = n_fraction_cycles
    n_exponent_cycles = n_fraction_values

    n_exponent_bits = bitwidth - n_fraction_bits # there is no sign bit

    (; bitwidth, precision, n_values, 
       n_exponent_bits, n_exponent_values, n_exponent_cycles,
       n_fraction_bits, n_fraction_values, n_fraction_cycles)
end


#=
n_fraction_cycles * n_fraction_values == n_exponent_cycles * n_exponent_values == n_values

n_fraction_values == n_exponent_cycles
n_fraction_cycles == n_exponent_values
=#
