using Test
include("../src/graph.jl")  # Adjust the path if necessary

@testset "Graph Structure Tests" begin

    graph = initialize_graph()

    # Test node creation and addition
    @testset "Node Creation and Addition" begin
        actor = Actor(2, "Actor B")
        artifact = Artifact(2, "Artifact B", actor.id)
        collection = Collection(2, "Collection B")

        add_actor!(graph, actor)
        add_artifact!(graph, artifact)
        add_collection!(graph, collection)

        @test nv(graph) == 3  # 3 nodes added
        @test MetaGraphs.get_prop(graph, 1, :type) == :actor
        @test MetaGraphs.get_prop(graph, 2, :type) == :artifact
        @test MetaGraphs.get_prop(graph, 3, :type) == :collection
    end

    # Test edge addition and status updates
    @testset "Edge Addition and Status Updates" begin
        # Assuming IDs for actor, artifact, and collection are 1, 2, and 3 respectively
        add_artifact_collection_edge!(graph, 2, 3)  # Default to suggested
        edge_id = find_edge(graph, 2, 3)
        @test edge_id !== nothing  # Edge exists
        @test MetaGraphs.get_prop(graph, edge_id, :status) == :suggested

        # Update the edge status to approved
        approve_artifact!(graph, 2, 3)
        @test MetaGraphs.get_prop(graph, edge_id, :status) == :approved
    end
end
