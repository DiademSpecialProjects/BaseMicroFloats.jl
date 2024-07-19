#= 
model = (; bitwidth, precision, n_values, 
           n_exponent_bits, n_exponent_values, n_exponent_cycles,
           n_fraction_bits, n_fraction_values, n_fraction_cycles)
=#

function construct_simplefloat(bitwidth, precision)
    model = characterize_SimpleFloat(bitwidth, precision)
    significands = construct_significand_series(model)
    exponents = construct_exponent_series(model)
    significands .* exponents
end

function construct_significand_series(model)
    fraction_sequence = (0:model.n_fraction_values-1) .// model.n_values
    normal_sequence = 1 .+ fraction_sequence
    append!(fraction_sequence, repeat(normal_sequence, model.n_fraction_cycles - 1))
end

function construct_exponent_series(model)
    biased_exponent_series = construct_biased_exponent_series(model)
    map(x->2.0^x, biased_exponent_series)
end

function construct_biased_exponent_series(model)
    bias = (model.n_exponent_values >> 1)
    raw_exponent_sequence = (0:model.n_exponent_values-1) 
    biased_exponent_sequence = collect(raw_exponent_sequence .- bias)
    biased_exponent_sequence[1] = biased_exponent_sequence[2] # exponent for subnormals is min exponent for normals
    collect(Iterators.flatten(map(x->fill(x, model.n_fraction_values), biased_exponent_sequence)))
end
