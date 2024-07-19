# defined by suggestion from Aqua to resolve ambiguities

SimpleFloat{BitWidth, Precision}(x::Real, rounding::RoundingMode) where {BitWidth, Precision} =
   throw(ErrorException("Aqua ambiguity"))
