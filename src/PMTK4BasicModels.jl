module PMTK4BasicModels

    export gammaLogprob
    include("gamma/gammaLogprob.jl")
    export gaussProb
    include("gauss/sub/gaussProb.jl")
    export contingencyTableUnpairedDiffPostMc
    include("sub/contingencyTableUnpairedDiffPostMc.jl")

end

