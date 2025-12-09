import sys
import argparse
import matplotlib.pyplot as plt
import networkx as nx


def parse_edge_list(filepath):
    """
    Parse an edge list file.
    
    Expected format (one edge per line):
    - "node1 node2" (space-separated)
    - "node1,node2" (comma-separated)
    - Supports comments starting with #
    """
    edges = []
    nodes = set()
    
    with open(filepath, 'r') as f:
        for line in f:
            line = line.strip()
            
            # Skip empty lines and comments
            if not line or line.startswith('#'):
                continue
            
            # Parse edge or single node
            if ',' in line:
                parts = [p.strip() for p in line.split(',') if p.strip()]
            else:
                parts = [p.strip() for p in line.split() if p.strip()]

            # Single token -> isolated node
            if len(parts) == 1:
                nodes.add(parts[0])
                continue

            # Two or more tokens -> treat as edge (first two tokens)
            if len(parts) >= 2:
                node1, node2 = parts[0], parts[1]
                edges.append((node1, node2))
                nodes.add(node1)
                nodes.add(node2)
    
    return list(nodes), edges


def visualize_graph(nodes, edges, output_file=None, title="Graph Visualization"):
    """
    Visualize a graph and optionally save it.
    
    Args:
        nodes: List of node labels
        edges: List of (node1, node2) tuples
        output_file: Optional file path to save the graph image
        title: Title for the graph
    """
    G = nx.Graph()
    
    # Add nodes and edges
    G.add_nodes_from(nodes)
    G.add_edges_from(edges)
    
    # Create figure
    plt.figure(figsize=(10, 8))
    plt.title(title, fontsize=16, fontweight='bold')
    
    # Draw graph
    pos = nx.spring_layout(G, k=0.5, iterations=50)
    nx.draw_networkx_nodes(G, pos, node_color='lightblue', node_size=1500)
    nx.draw_networkx_edges(G, pos, width=2, alpha=0.6)
    nx.draw_networkx_labels(G, pos, font_size=10, font_weight='bold')
    
    plt.axis('off')
    plt.tight_layout()
    
    # Save if output file specified
    if output_file:
        plt.savefig(output_file, dpi=150, bbox_inches='tight')
        print(f"Graph saved to {output_file}")
    
    # Show graph
    plt.show()


def main():
    parser = argparse.ArgumentParser(
        description='Visualize a graph from an edge list file.',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python graph-viz.py edges.txt
  python graph-viz.py edges.txt -o graph.png
  python graph-viz.py edges.txt -t "My Graph" -o output.png
        """
    )
    
    parser.add_argument('input', help='Path to edge list file')
    parser.add_argument('-o', '--output', help='Output file path (e.g., graph.png)')
    parser.add_argument('-t', '--title', default='Graph Visualization', help='Graph title')
    
    args = parser.parse_args()
    
    try:
        nodes, edges = parse_edge_list(args.input)
        
        if not nodes:
            print("Error: No nodes found in edge list.")
            sys.exit(1)
        
        print(f"Loaded {len(nodes)} nodes and {len(edges)} edges")
        visualize_graph(nodes, edges, args.output, args.title)
        
    except FileNotFoundError:
        print(f"Error: File '{args.input}' not found.")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)


if __name__ == '__main__':
    main()
