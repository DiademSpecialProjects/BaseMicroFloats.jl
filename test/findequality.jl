sf75 = SMF.SimpleMicroFloat(7,5)
model75 = SMF.characterize_SimpleFloat(7,5)
fraction_sequence75 = (0:model75.n_fraction_values-1) .// model75.n_fraction_values
normal_sequence75 = 1 .+ fraction_sequence75

bias75 = (model75.n_exponent_values >> 1)
raw_exponent_sequence75 = (0:model75.n_exponent_values-1) 
biased_exponent_sequence75 = collect(raw_exponent_sequence75 .- bias)

sf86 = SMF.SimpleMicroFloat(8,6)
model86 = SMF.characterize_SimpleFloat(8,6)
fraction_sequence86 = (0:model86.n_fraction_values-1) .// model86.n_fraction_values
normal_sequence86 = 1 .+ fraction_sequence86

bias86 = (model86.n_exponent_values >> 1)
raw_exponent_sequence86 = (0:model86.n_exponent_values-1) 
biased_exponent_sequence86 = collect(raw_exponent_sequence86 .- bias86)


sf53 = SMF.SimpleMicroFloat(5,3)
model53 = SMF.characterize_SimpleFloat(5,3)
fraction_sequence53 = (0:model53.n_fraction_values-1) .// model53.n_fraction_values
normal_sequence53 = 1 .+ fraction_sequence53
bias53 = (model53.n_exponent_values >> 1)
raw_exponent_sequence53 = (0:model53.n_exponent_values-1) 
biased_exponent_sequence53 = collect(raw_exponent_sequence53 .- bias53)
