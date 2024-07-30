function show_consistent_rationals(encoding, values)
    enc = hexstr.(encoding)
    vals = consistent_rationals(values)
    z = zip(enc, vals)
    s = """\n"""
    for i in z                                                                                                             
      s = s * (string("\n",i[1],"\t",i[2]))                                                                            
    end
    s * "\n"
end

# show_consistent_rationals(encoding(SMF87),vcat(0, diff( values(SMF87))))

function hexstr(x)
  s = @sprintf("%x", x)
  if x < 0x10
    s = "0" * s
  end
  "0x" * s
end

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
