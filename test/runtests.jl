using Test, Cartan

@testset "frame2group! tests" begin
    @testset "Identity frame test" begin
        r = [1.0, 2.0]
        e = [1.0 0.0; 0.0 1.0]
        S = zeros(3,3)
        
        expected = [1.0 0.0 0.0;
                   1.0 1.0 0.0;
                   2.0 0.0 1.0]
        
        frame2group!(S, r, e)
        @test isapprox(S, expected, atol=1e-10)
    end
    
    @testset "Rotated frame test" begin
        θ = π/4
        r = [1.0, 0.0]
        e = [cos(θ) -sin(θ); sin(θ) cos(θ)]
        S = zeros(3,3)
        
        expected = [1.0 0.0 0.0;
                   1.0 cos(θ) -sin(θ);
                   0.0 sin(θ) cos(θ)]
        
        frame2group!(S, r, e)
        @test isapprox(S, expected, atol=1e-10)
    end
    
    @testset "SE(2) properties" begin
        r = [2.0, -1.0]
        e = [0.0 -1.0; 1.0 0.0]
        S = zeros(3,3)
        frame2group!(S, r, e)
        
        @test isapprox(S[1,:], [1.0, 0.0, 0.0], atol=1e-12)
        
        R = S[2:3, 2:3]
        @test isapprox(R'R, I(2), atol=1e-12)
        @test isapprox(det(R), 1.0, atol=1e-12)
        
        @test isapprox(S[2:3,1], r, atol=1e-12)
    end
end