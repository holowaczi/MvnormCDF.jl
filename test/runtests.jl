using mvnormCDF
using Test, Distributions

testarr = Array{Any}(2,5)

#2 dimensional 
#cov matrix
testarr[1,1] = [1 0.5;
                0.5 1]
testarr[1,2] = [0, 0]

#Point were to calculate cdf
testarr[1,3] = [0, 0]

#Expected value
testarr[1,4] = 0.33333333

#Acceptable error
testarr[1,5] = 10^-5


#3 dimensional
#cov matrix
testarr[2,1] = [1 0.5 -0.5;
                0.5 1 0;
                -0.5 0 2]
testarr[2,2] = [0, 0, 3]

#Point were to calculate cdf
testarr[2,3] = [1, 2, 3]

#Expected value
testarr[2,4] = 0.38330222

#Acceptable error
testarr[2,5] = 10^-5

@testset "mvnormCDF.jl" begin
    for i in 1:2
        cov = testarr[i,1]
        mu = testarr[i,2]
        p = testarr[i,3]
        exv = testarr[i,4]
        err = testarr[i,5]
        value = mvnorm_cdf(MvNormal(mu,cov),p)
        @test value ≈ exv atol=err
    end
end
