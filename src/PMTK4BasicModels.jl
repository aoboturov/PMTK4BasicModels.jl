module PMTK4BasicModels

    export gaussProb, gammaLogprob

    include("gamma/gammaLogprob.jl")
    include("gauss/sub/gaussProb.jl")

end

