function consistent_rationals(xs)
  map((n,d)->string(n,"/",d), consistent_numers(xs), fill(maxdenom(xs), length(xs)))
end

maxdenom(xs) = maximum(denominator.(rationalize.(xs)))

function consistent_numers(xs)
    mx = maxdenom(xs)
    ys = rationalize.(xs)
    numrs = Int[]
    for y in ys
      n = numerator(y) * mx
      z = div(n, denominator(y))
      push!(numrs, z)
    end
    numrs
end
