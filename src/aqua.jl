# defs follow suggestions from Aqua to resolve ambiguities

SimpleMicroFloat{BitWidth, Precision}(x::Real, rounding::RoundingMode) where {BitWidth, Precision} = nothing

SimpleFloat{BitWidth, Precision}(x::Real, rounding::RoundingMode) where {BitWidth, Precision} = nothing
