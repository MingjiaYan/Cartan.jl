module Cartan

# greet() = print("Hello World!")

export frame2group!

function frame2group!(S::Matrix{Float64}, r::Vector{Float64}, e::Matrix{Float64})

    """

    Convert a moving frame (r,e) to an SE(2) matrix representation.

    Parameters:
    - r::Vector{Float64} - centerline positions, size (2,)
    - e::Matrix{Float64} - frame vectors, size (2,2)
    - S::Matrix{Float64} - output SE(2) matrices, size (3,3)

    Returns:
    Nothing (mutates S)

    The SE(2) matrix at each point has the form:
    [1  0]
    [r  R]

    where R = [e1 e2] is the rotation matrix formed by the frame vectors.
    """
    
    # Initialise SE(2) matrices
    # First row of S: [1 0 0]
    S[1,:] = [1.0 0.0 0.0]

    # Translation part of S: position vector r
    S[2:3,1] .= r

    # Rotation part of S: adapted frame vectors e_i
    S[2:3,2:3] .= e
    
    return nothing
end

end # module Cartan
