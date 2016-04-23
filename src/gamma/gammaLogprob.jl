type ScalarOrArray{T<:Number}
    v::Union{T,AbstractArray{T,1}}
end

"""
    gammaLogprob(1, 2, [1; 2])

logp(i) = log p(X(i) | a, b)
a is the shape
b is the rate, i.e. 1/scale
"""
function gammaLogprob{T<:Number,U<:Number,V<:Number}(a::T, b::U, X::AbstractArray{V,1})
    gammaLogprob_(ScalarOrArray(a), ScalarOrArray(b), X)
end

"""
    gammaLogprob([.1; .3], [.2; .4], [1; 2])

logp(i) = log p(X(i) | a, b)
a is the shape
b is the rate, i.e. 1/scale
"""
function gammaLogprob{T<:Number,U<:Number,V<:Number}(a::AbstractArray{T,1}, b::AbstractArray{U,1}, X::AbstractArray{V,1})
    @assert length(a)==length(b) string("a=", length(a), " and b=", length(b), " must have same length")
    @assert length(a)==length(X) string("a=", length(a), " and X=", length(X), " must have same length")
    gammaLogprob_(ScalarOrArray(a), ScalarOrArray(b), X)
end

function gammaLogprob_{T<:Number,U<:Number,V<:Number}(a::ScalarOrArray{T}, b::ScalarOrArray{U}, X::AbstractArray{V,1})
    logZ = lgamma(a.v) - (a.v).*log(b.v);
    logp = (a.v-1).*log(X) - (b.v).*X - logZ;
end

