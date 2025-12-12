import statistics
import pandas as pd
import matplotlib.pyplot as plt
import os

def get_per_file_data(file, indep_graph, rec_graph):

    is_rec : bool = False

    with open(file) as f:
        for line in f:

            if line[0] != '#':
                continue

            if line.startswith("# ("):
                is_rec = True
                line = next(f,None)

            cur_func = str(line.split(":", 1)[1].strip())
            V = int(next(f,None).split("=", 1)[1].strip().split()[0])
            E = int(next(f,None).split("=", 1)[1].strip().split()[0])
            CHI = int(next(f,None).split("=", 1)[1].strip().split()[0])
            mex_deg = int(next(f,None).split("=", 1)[1].strip().split()[0])
            avg_deg = float(next(f,None).split("=", 1)[1].strip().split()[0])
            num_unex = int(next(f,None).split(":", 1)[1].strip().split()[0][0])

            # Keep track of this table pattern
            value = (V, E, E / (V + 1e-9), CHI, mex_deg, avg_deg, num_unex)

            if is_rec:
                rec_graph[file + cur_func] = value
            else:
                indep_graph[file + cur_func] = value

            is_rec = False

def grab_all_file_nums(folder, indep_graph, rec_graph):
    for entry in os.listdir(folder):
        full_path = os.path.join(folder, entry)
        if os.path.isfile(full_path):
            get_per_file_data(full_path,indep_graph,rec_graph)

def compute_stats(folder):

    # __store pattern__

    # |V|                           |   0
    # |E|                           |   1
    # |V| / |E|                     |   2
    # CHI                           |   3
    # max_degree                    |   4
    # avg_degree                    |   5
    # Number of unexpanded functions|   6

    indep_graph: dict[str, tuple[int, int, float, int, int, float, int]] = {}
    rec_graph: dict[str, tuple[int, int, float, int, int, float, int]] = {}

    grab_all_file_nums(folder,indep_graph,rec_graph)

    graph_types = {"Independent Sets": indep_graph,
                   "Recursive Interference Sets": rec_graph}


    fig, axes = plt.subplots(nrows=len(graph_types), ncols=1, figsize=(10, 6))

    fig2, axes2 = plt.subplots(nrows=len(graph_types), ncols=1, figsize=(10, 6))

    fig3, axes3 = plt.subplots(nrows=len(graph_types), ncols=1, figsize=(10, 6))

    axes_flat = axes.flatten()
    axes_flat2 = axes2.flatten()
    axes_flat3 = axes3.flatten()

    for (key,value), ax, ax2, ax3 in zip(graph_types.items(), axes_flat, axes_flat2, axes_flat3):
        df = pd.DataFrame.from_dict(value,orient='index')

        stddev = statistics.stdev(df[2])
        mn = statistics.mean(df[2])

        ax.hist(df[2],bins=30, color='skyblue', edgecolor='black')
        ax.set_title(key + f" Comparison of Edge per Vertex Across Functions | μ({mn:.2f} ± {stddev:.2f})")
        ax.set_xlabel('|E| / |V|')
        ax.set_ylabel('Graph Frequency')

        ax2.hist(df[3],bins=30, color='skyblue', edgecolor='black')
        ax2.set_title(key + f" Comparison of Chromatic Number Across Functions | μ({mn:.2f} ± {stddev:.2f})")
        ax2.set_xlabel('Chromatic Number')
        ax2.set_ylabel('Graph Frequency')

        ax3.hist(df[1] / df[3], bins=30, color='skyblue', edgecolor='black')
        ax3.set_title(key + f" Comparison of Edges per Chromatic Number Across Functions | μ({mn:.2f} ± {stddev:.2f})")
        ax3.set_xlabel('Edges per Chromatic Number')
        ax3.set_ylabel('Graph Frequency')

    fig.tight_layout()
    fig2.tight_layout()
    fig3.tight_layout()

    plt.show()

compute_stats("output_graph")