using Printf

function show_consistent_rationals(encoding::Vector{E}, values::Vector{V}) where {E<:Integer, V<:Real}
    enc = map(hexstr, encoding)
    vals = consistent_rationals(values)
    z = zip(enc, vals)
    s = """\n"""
    for i in z                                                                                                             
      s = s * (string("\n",i[1],"\t",i[2]))                                                                            
    end
    s * "\n"
end

# show_consistent_rationals(encoding(SMF87),vcat(0, diff( values(SMF87))))

function hexstr(x::I) where {I<:Integer}
  s = @sprintf("%x", x)
  if x < 0x10
    s = "0" * s
  end
  "0x" * s
end

function consistent_rationals(xs::Vector{T}) where {T<:Real}
  n = length(xs)
  denoms = fill(maxdenom(xs), n)
  numers = consistent_numers(xs)
  println((typeof(denoms), typeof(numers)))
  map((n,d)->string(n,"/",d), numers, denoms)
end

maxdenom(xs::Vector{T}) where {T<:Real} = maximum(denominator.(rationalize.(xs)))

function consistent_numers(xs::Vector{T}) where {T<:Real}
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
