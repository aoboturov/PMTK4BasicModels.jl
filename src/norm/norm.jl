"""
Multivariate Gaussian distribution, pdf
X[i,:] is i'th case
"""
function normpdf{T<:Real,U<:Real,V<:Real}(μ::AbstractArray{U,1}, Σ::AbstractArray{V,2}, X::AbstractArray{T,2})
    @assert size(Σ, 1)==size(Σ, 2) string("Σ should be a square matrix, but is a ", size(Σ, 1), "x", size(Σ, 2), " matrix")
    d = size(Σ, 2)

    @assert size(X, 2)==d string("X μst be a NxD matrix, but is Nx", size(X, 2))
    @assert length(μ)==d string("μ μst be a D=", d, " but is a ", length(μ), " matrix")

    Xc = broadcast(-, μ', X)
    logP = -0.5*sum((Xc/Σ).*Xc, 2)
    logP = reshape(logP, size(logP, 1))
    logZ = (d/2)*log(2*pi) + 0.5*logdet(Σ)

    return exp(logP - logZ)
end

