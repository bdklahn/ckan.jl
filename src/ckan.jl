module ckan

using URIs
using JSON3
using HTTP

export url

"""
Generate a ckan-patterned url
E.g.
https://data.virginia.gov/datastore/dump/de3ab3a5-3f98-4254-960b-54bd387e563e?format=json&limit=999999
"""
function url(host::String, UUID::String;
    query::String="limit=999999"
    )
    path = "/datastore/dump/$UUID"
    query = "format=json&$query"
    URI(;scheme="https", host, path, query)
end

"""
Get a JSON dataset from a ckan host.
"""
function get(host::String, UUID::String;
    query::String="limit=999999"
    )
    this_url = url(host, UUID; query)
    JSON3.read(HTTP.get(this_url).body)
end

end # module ckan