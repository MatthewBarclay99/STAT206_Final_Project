"""
Plot a vector in a new figure. Default origin is `(0,0)`.
"""
function plotvec(v; kwargs...)
    fig = plot()
    plotvec!(fig, v; kwargs...)
    return fig
end

"""
Plot a vector, `v`, in the given `fig`.

Must be given as a `Tuple{T,S}` where `T` and `S` are subtypes of `Real`.
"""
function plotvec!(fig, v::NTuple{2,Real};
    origin = (0,0), kwargs...)
    # Define some helper function used only locally
    make_tuple(x::Tuple) = x
    make_tuple(x::Vector) = (x[1], x[2])
    
    # Go back to plotting 
    plot!(fig, [make_tuple(origin), v]; lw = 3, arrow = :arrow, label = "", kwargs...)
    scatter!(fig, v; ms = 5, color = :black, label = "")
    return fig
end

"""
Plot a collection of vectors, given as a `Vector`.
"""
function plotvec!(fig, vs::Vector; kwargs...)
    for v in vs
        plotvec!(fig, v; kwargs...)
    end
    return fig
end

"""
Plot a `Vector{T}` where `T <: Real` by converting to a `Tuple`.

Only the first two coordinates are used.
"""
function plotvec!(fig, v::Vector{T}; kwargs...) where T <: Real
    plotvec!(fig, (v[1], v[2]); kwargs...)
end
