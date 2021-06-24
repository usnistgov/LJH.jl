using LJH
using Test
const WT = false # run @code_warntype

# clean out the artifacts directory
isdir("artifacts") && rm("artifacts",recursive=true)
mkdir("artifacts")

testfiles = [
    "ljh",
    "ljh3",
    "ljhutil",
    ]

# In later versions of Julia (≥1.3 maybe?), you can use
# Pkg.test("Pope"; test_args=["ljh", "ljh3"]) to select a subset of
# tests, but this won't affect ARGS in earlier versions.
if length(ARGS) > 0
    tests = ARGS
end

@testset "LJH" begin

for t in testfiles
    fp = joinpath(dirname(@__FILE__), "$t.jl")
    println("Running $fp ...")
    include(fp)
end

end # @testset
