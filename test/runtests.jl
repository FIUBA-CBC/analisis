using Test

function execute(filename::AbstractString)
    try
        result = include(filename)
        return true
    catch e
        print(e.message)
        return false
    end
end

notebooks_path = joinpath("..","notebooks")
println("Notebooks path: ",notebooks_path) 
paths = [ joinpath(a,d) for (a,b,c) in walkdir(notebooks_path) if length(b)==0 for d in c if occursin(".jl",d)]
@test length(paths) > 0

@testset "Notebooks execution of: $path" for path in paths
        result = execute(path);
        @test result
end