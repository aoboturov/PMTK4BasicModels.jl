using Distributions
using KernelEstimator

"""
Unpaired contingency table
"""
function contingencyTableUnpairedDiffPostMc(n1::Real, y1::Real, n2::Real, y2::Real)
    S = 10000
    rn1 = Beta(y1+1, n1-y1+1)
    θ1 = rand(rn1, S)
    rn2 = Beta(y2+1, n2-y2+1)
    θ2 = rand(rn2, S)
    diff = θ1-θ2
    den = kerneldensity(diff)
    (θ1, θ2, diff, den)
end

