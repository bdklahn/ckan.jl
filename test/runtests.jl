using ckan
using Test
using URIs

const test_host = "data.virginia.gov"
const test_UUID = "de3ab3a5-3f98-4254-960b-54bd387e563e"
const test_query = "limit=3"

@testset "ckan.jl" begin
    @test url(test_host, test_UUID; query=test_query) == URI("https://$test_host/datastore/dump/$test_UUID?format=json&$test_query")
end
