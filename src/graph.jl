# Refactored code to use both SimpleGraph and MetaGraph functionalities
using LightGraphs
using MetaGraphs

import LightGraphs.SimpleGraphs: add_vertex!, add_edge!
import MetaGraphs: add_vertex!, add_edge!, set_props!, set_prop!, find_edge

abstract type Node end

struct Actor <: Node
    id::Int
    name::String
end

struct Artifact <: Node
    id::Int
    name::String
    creator_id::Int  # Link to its creator (Actor)
end

struct Collection <: Node
    id::Int
    name::String
end

# Unified edge type with a status attribute
struct ArtifactCollectionEdge
    artifact_id::Int
    collection_id::Int
    status::Symbol  # :suggested or :approved
end

# Custom add_vertex! method for MetaDiGraph that behaves like SimpleDiGraph's add_vertex!
function add_vertex!(graph::MetaDiGraph)
    v = add_vertex(graph)
    return v
end

# Graph initialization using MetaDiGraph
function initialize_graph()
    graph = MetaDiGraph()
    return graph
end

# Adding nodes to the graph
function add_actor!(graph, actor::Actor)
    add_vertex!(graph)
    set_props!(graph, nv(graph), Dict(:type => :actor, :id => actor.id, :name => actor.name))
end

function add_artifact!(graph, artifact::Artifact)
    add_vertex!(graph)
    set_props!(graph, nv(graph), Dict(:type => :artifact, :id => artifact.id, :name => artifact.name, :creator_id => artifact.creator_id))
end

function add_collection!(graph, collection::Collection)
    add_vertex!(graph)
    set_props!(graph, nv(graph), Dict(:type => :collection, :id => collection.id, :name => collection.name))
end

# Adding and updating edges
function add_artifact_collection_edge!(graph, artifact_id::Int, collection_id::Int, status::Symbol=:suggested)
    edge = find_edge(graph, artifact_id, collection_id)
    if edge === nothing
        add_edge!(graph, artifact_id, collection_id)
        edge = find_edge(graph, artifact_id, collection_id)
    end
    set_prop!(graph, edge, :status, status)
end

function approve_artifact!(graph, artifact_id::Int, collection_id::Int)
    add_artifact_collection_edge!(graph, artifact_id, collection_id, :approved)
end

# Example initialization and usage
graph = initialize_graph()
actor = Actor(1, "Actor A")
artifact = Artifact(1, "Artifact A", actor.id)
collection = Collection(1, "Collection A")

add_actor!(graph, actor)
add_artifact!(graph, artifact)
add_collection!(graph, collection)
add_artifact_collection_edge!(graph, artifact.id, collection.id)  # Suggested by default
approve_artifact!(graph, artifact.id, collection.id)  # Change to approved