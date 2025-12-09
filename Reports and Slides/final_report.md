Final Report (Due on 12/11/2025)

Introduction, including a summary of the project, related work/methods, and the results of this project.

Problem description, including a detailed description of the problem you address in this project.

Methodology, including a detailed description on the methods you developed or used.

Experiments, including, experiment setting, results, and your observations.

Conclusion and future work, including a summary of the main contributions of this project and potential future directions.




<style>
body {
	font-family: "Times New Roman", serif;
	font-size: 12pt;
}
</style>


<h1 style="text-align:center;">Graph Coloring for Efficient Code Compilation</h1>
<h3 style="text-align:center;">Andrew Erickson, Ethan Rapa, Haven Cook </h3>
<h4 style="text-align:center;">December 11, 2025</h3>


### Introduction

Register allocation is a core component in modern compiler backends, determining how program variables are mapped onto a limited number of machine registers. This mapping problem can be represented as a graph coloring task on a variable interference graph, where each vertex corresponds to a virtual register and edges denote liveness conflicts. Because graph coloring is NP-hard, compilers rely on heuristics such as greedy coloring, Chaitin’s algorithm, or linear-scan allocation.

Recent research explores whether Graph Neural Networks (GNNs) or Graph Transformers can outperform classical heuristics by learning structure present in real interference graphs. Our project originally aimed to conduct a meta-study of classical and deep learning–based graph coloring methods for register allocation. Over time, this evolved into a more fundamental problem: existing datasets were not suitable for studying real register interference, either because they were not interference graphs at all (e.g., DIMACS COLOR dataset) or because they contained unrealistic linear-scan approximations of live ranges (IEEE Dataset).

Therefore, the practical contribution of this project shifted toward designing and implementing a pipeline to generate high-quality interference graphs from LLVM IR, producing a dataset that could support machine learning research on register allocation. We additionally implemented coloring algorithms to generate baseline results on this dataset.

Our results demonstrate that real program interference graphs have structural properties absent from synthetic datasets, and that constructing them correctly requires nontrivial handling of SSA, Phi-nodes, per-block liveness, and function call semantics. While we did not complete training of a neural model, we created a working pipeline capable of generating high-fidelity interference graphs suitable for future ML research.


### Problem Description

Efficient register allocation greatly affects execution speed and compiled code quality. Given a limited register file, a compiler attempts to assign a register to each variable without conflict. If too many simultaneously-live variables exist, the compiler must spill some to memory, which significantly slows execution.

This assignment task is equivalent to coloring an interference graph (IG):
- Each vertex → a virtual register in SSA form
- Each edge → the two registers are simultaneously live
- Objective → assign as few colors (registers) as possible
- Constraint → adjacent vertices cannot share a color

The core problem is:

- How can we accurately construct interference graphs from real LLVM IR files and assess coloring algorithms on these graphs?

The project encountered key challenges:
1. Existing datasets are unsuitable. DIMACS datasets do not represent interference structure. IEEE datasets use simplistic live-range heuristics, failing to capture SSA semantics, φ-nodes, and control-flow complexity.

2. Constructing interference graphs from real code is nontrivial. It requires the following:
   - Building a Control Flow Graph (CFG)
   - Performing per-block liveness analysis
   - Computing live-in and live-out sets iteratively
   - Handling φ-nodes correctly
   - Merging interference across function calls according to calling conventions
   - Managing multiple functions and files

3. Scaling to large programs. Even a small program produces hundreds or thousands of virtual registers in SSA form.

Thus the central technical contribution of this work is a complete, correct, LLVM-based interference graph generator, which forms the foundation for future learning-based register allocation research.

### Methodology
We began with LLVM IR, which uses Static Single Assignment (SSA):
- Each virtual register is assigned exactly once.
- φ-nodes merge values across control-flow paths.
- SSA drastically simplifies dependency tracking but complicates liveness.

Our pipeline extracts from LLVM IR:
- Basic blocks and their instructions
- Virtual registers defined and used within each block
- φ-node semantics for loop back-edges and conditional branches
- Successor relationships forming the control-flow graph

To compute live ranges, we implemented the standard iterative worklist algorithm:

``` sql
IN[n]  = USE[n] ∪ (OUT[n] – DEF[n])
OUT[n] = ⋃ IN[s] for all successors s of n
```

Iteration continues until all IN/OUT sets stabilize.

This produces:
- The set of variables live-in to each block
- The set of variables live-out
- Edges in the interference graph whenever two variables are simultaneously live

Using liveness sets, we construct edges in the interference graph:
- Variables simultaneously live-in a block interfere
- Variables simultaneously live-out interfere
- Variables in φ-nodes interfere according to predecessor edges
- Function calls require special handling:
  - Under x86 cdecl, caller-saved registers (EAX, ECX, EDX) must be reloaded
  - Any variable live across a call must interfere with the function’s entire local register set

Multiple functions are merged by combining their interference graphs and adding supernodes representing call interactions.

We implemented several baseline coloring methods:

Greedy Coloring:
Nodes are colored in arbitrary or degree-based order.

Largest-First Ordering:
Nodes processed from highest to lowest degree.

Independent-Set Extraction:
Maximal independent sets represent sets of registers sharable by the same physical register.

These algorithms serve as baselines for later neural models.

Because no suitable dataset existed, the major outcome of this project is a full dataset-generation pipeline, including:

- Automatic compilation of C/C++ files into LLVM IR
- Per-function CFG construction
- Full liveness propagation
- Generation of interference graphs for each function
- Storage of graph structure and ground-truth colorings

This dataset is significantly more realistic than the IEEE linear-scan dataset, especially due to proper SSA and CFG handling.

### Experiments

We tested the pipeline on small-to-medium C programs to verify correctness:
- Purely arithmetic loops
- Multiple-function programs
- Programs with deep branching and nested loops
- Programs including library calls

Tools used:
- LLVM 17 toolchain
- Python for parsing and liveness analysis
- NetworkX for graph representation
- Baseline coloring implementations in Python

Correctness of Graph Construction

We validated correctness by manually verifying:
- Live-in and live-out sets
- φ-node dependencies
- Accurate handling of branch divergence and loop back-edges
- Interference edges for nested and multi-function programs

All tests matched expected liveness and conflict behavior.

### Conclusion and Future Work

This project makes several contributions:
- A complete pipeline for generating realistic interference graphs from LLVM IR
- Correct, SSA-aware liveness analysis implementation
- Accurate handling of φ-nodes, CFG semantics, and calling conventions
- Baseline classical graph coloring algorithm implementations
- A curated dataset of real program interference graphs, suitable for ML research

Although we did not reach the stage of training neural models, we constructed the crucial groundwork needed for future work in learning-assisted register allocation.

Several promising directions remain:

1. Train Graph Neural Networks or Graph Transformers and evaluate whether they can:
   - Reduce register count
   - Reduce spill count
   - Improve coloring time vs. heuristics
2. Generate canonical subgraph patterns
- Useful for libraries, common idioms, or standard loops.
3. Expand dataset with large real programs
- Build a massive corpus for research use.
4. Analyze calling convention edge cases
- Handle AVX registers, volatile registers, and architecture-specific semantics.