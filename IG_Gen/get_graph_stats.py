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

    graph_types = (indep_graph,rec_graph)

    for dat in graph_types:
        df = pd.DataFrame.from_dict(dat,orient='index')

        df[2].hist(bins=30, color='skyblue', edgecolor='black')
        print(df[2])
        plt.title('Test')
        plt.xlabel('Value')
        plt.ylabel('Frequency')
        plt.show()

compute_stats("output_graph")