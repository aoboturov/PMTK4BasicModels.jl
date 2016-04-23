"""
Univariate Gaussian distribution, pdf
*** In the univariate case, Sigma is the variance, not the standard deviation! ***
"""
function gaussProb{T<:Number,U<:Number,V<:Number}(X::AbstractArray{T,1}, mu::U, Sigma::V)
    return gaussProb(reshape(X, length(X), 1), [mu], reshape([Sigma], 1, 1))
end

"""
Multivariate Gaussian distribution, pdf
X(i,:) is i'th case
"""
function gaussProb{T<:Number,U<:Number,V<:Number}(X::AbstractArray{T,2}, mu::AbstractArray{U,1}, Sigma::AbstractArray{V,2})
    @assert size(Sigma, 1)==size(Sigma, 2) string("Sigma should be a square matrix, but is a ", size(Sigma, 1), "x", size(Sigma, 2), " matrix")
    d = size(Sigma, 2)

    @assert size(X, 2)==d string("X must be a NxD matrix, but is Nx", size(X, 2))
    @assert length(mu)==d string("mu must be a D=", d, " but is a ", length(mu), " matrix")

    Xc = broadcast(-, mu', X)
    logP = -0.5*sum((Xc/Sigma).*Xc, 2)
    logP = reshape(logP, size(logP, 1))
    logZ = (d/2)*log(2*pi) + 0.5*logdet(Sigma)

    return exp(logP - logZ)
end

