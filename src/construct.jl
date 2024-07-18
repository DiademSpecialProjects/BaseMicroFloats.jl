#   model: (; bitwidth, precision, n_sign_bits, n_exponent_bits, n_fraction_bits,
#             n_sign_values, n_exponent_values, n_fraction_values,
#             n_exponent_cycles, n_fraction_cycles)

function construct_simplefloat(bitwidth, precision)
    model = SimpleFloatModel(bitwidth, precision)
    fractions = construct_fraction_series(model.n_fraction_values, model.n_fraction_cycles)
    exponents = construct_exponent_series(model.n_exponent_values, model.n_exponent_cycles)

end

function construct_fraction_series(n_values, n_cycles)
    fraction_sequence = (0:n_values-1) .// n_values
    mixed_fraction_sequence = 1 .+ fraction_sequence
    mixed_fraction_series = Iterators.flatten(fill(mixed_fraction_sequence, n_cycles-1))
    append!(fraction_sequence, mixed_fraction_series)
    fraction_sequence
end

function construct_exponent_series(n_values, n_cycles)
    exponent_sequence = construct_exponent_sequence(n_values)
end
