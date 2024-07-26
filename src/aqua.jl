# defs follow suggestions from Aqua to resolve ambiguities

# SimpleMicroFloat{BitWidth, Precision}(x::Real, rounding::RoundingMode) where {BitWidth, Precision} = false
# SimpleFloat{BitWidth, Precision}(x::Real, rounding::RoundingMode) where {BitWidth, Precision} = false
SimpleMicroFloat(::Real, ::RoundingMode) = nothing
SimpleFloat(::Real, ::RoundingMode) = nothing
