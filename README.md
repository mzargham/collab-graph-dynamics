# Dynamic Graph Simulation

## Overview

This repository contains a Julia project aimed at simulating a dynamic graph with three types of nodes: Actors, Artifacts, and Collections. Actors produce Artifacts and suggest their inclusion in Collections, while Collections curate these Artifacts. The simulation explores the relationships between these entities, including membership of Actors in Collections and the approval process of Artifacts into Collections. Artifacts can belong to multiple Collections, illustrating the many-to-many relationships inherent in this system. The purpose of this project is to model and analyze the dynamic interactions and relationships between individual and group-level agents in a networked environment.

## File Structure

The project is structured into several key files and directories:

- [x] `README.md` - This file, explaining the project, how to get started, and how to contribute.
- [ ] `demo.ipynb` - This file show how the various pieces fit together to produce simulations and results
- [ ]`src/`
  - [x] `graph.jl` - Defines the basic data structures for nodes and edges using LightGraphs.jl, establishing the state of the model.
  - [ ] `dynamics.jl` - (Planned) Will define the dynamics of the simulation, detailing how nodes and edges evolve over time.
  - [ ] `simulation.jl` - (Planned) Will use the state defined in `graph.jl` and the dynamics in `dynamics.jl` to run the simulation.
  - [ ] `visualize.jl` - (Planned) Will provide functionality for visualizing the state and evolution of the graph over time.
- [ ] `tests/` - Contains test files for verifying the functionality and integrity of the simulation components.
  - [x] `test_graph.jl` - Tests for `graph.jl`, ensuring that nodes and edges are correctly created and manipulated. (Implemented)

Note: Currently, only `graph.jl` and its associated tests (`test_graph.jl`) have been implemented. The remaining files are planned for future development.

## Getting Started

To get started with this project, you'll need to have Julia installed on your system. You can download Julia from [the official Julia language website](https://julialang.org/downloads/).

Once Julia is installed, clone this repository to your local machine:

```bash
git clone https://github.com/your-repository-url-here/dynamic-graph-simulation.git
cd dynamic-graph-simulation
```

## Running Tests

To ensure that the foundational components of the simulation are working as expected, we've provided a test suite for `graph.jl`. To run these tests, navigate to the project directory in your terminal and execute the following command in Julia's REPL:

```julia
include("tests/test_graph.jl")
```

This command will run the tests defined in `test_graph.jl`, outputting the results to your terminal. Successful test execution will confirm that the basic graph structure and functionality are correctly implemented.

## Contributing

We welcome contributions to this project! Whether you're interested in adding new features, improving the simulation dynamics, or fixing bugs, your input is valuable. Please feel free to fork the repository, make your changes, and submit a pull request.

---

This README provides a starting point for documenting your project. As your simulation grows in complexity and scope, you should update this document to reflect new functionalities, dependencies, and instructions for users and contributors.