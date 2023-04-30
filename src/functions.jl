using HCubature, Distributions,Statistics, StatsBase, LinearAlgebra

params(d::MvNormal) = (d.μ, d.Σ)

function mvnorm_cdf(dist::MvNormal, coords::Vector)
    dims = length(dist)
    μ, Σ = params(dist)
    if Diagonal(Σ) == Σ
        return prod(cdf(Normal(μ[i],Σ[i,i]),coords[i]) for i in 1:dims)
    else
        lows = [μ[i] - 7*Σ[i,i] for i in 1:dims]
        return hcubature(x -> pdf(dist,x), lows,coords,maxevals=10^5*dims)[1]
    end
end