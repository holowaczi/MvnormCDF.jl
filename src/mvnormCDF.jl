module mvnormCDF

using HCubature, Distributions,Statistics, StatsBase, LinearAlgebra

include("functions.jl")

export mvnorm_cdf, params

end
