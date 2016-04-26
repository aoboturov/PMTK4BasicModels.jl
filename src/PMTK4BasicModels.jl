module PMTK4BasicModels

    include("gamma/gamma.jl")
    export normpdf
    include("norm/norm.jl")
    export contingencyTableUnpairedDiffPostMc
    include("sub/contingencyTableUnpairedDiffPostMc.jl")

end

