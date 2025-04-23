class Node:
    def __init__(self, value=None, children=None):
        self.value = value
        self.children = children if children else []

def alpha_beta_pruning(node, depth, alpha, beta, maximizing_player, path=[], parent=None):
    if depth == 0 or not node.children:
        print(f"Leaf Node: {node.value}, Path: {' -> '.join(path)}")
        return node.value

    if maximizing_player:
        max_eval = float('-inf')
        for i, child in enumerate(node.children):
            path.append(f"Max-{i}")
            eval = alpha_beta_pruning(child, depth - 1, alpha, beta, False, path, f"Max-{i}")
            path.pop()
            max_eval = max(max_eval, eval)
            alpha = max(alpha, eval)
            if beta <= alpha:
                print(f"Pruning at Max Node: {node.value}, Path: {' -> '.join(path)}")
                break
        return max_eval
    else:
        min_eval = float('inf')
        for i, child in enumerate(node.children):
            path.append(f"Min-{i}")
            eval = alpha_beta_pruning(child, depth - 1, alpha, beta, True, path, f"Min-{i}")
            path.pop()
            min_eval = min(min_eval, eval)
            beta = min(beta, eval)
            if beta <= alpha:
                print(f"Pruning at Min Node: {node.value}, Path: {' -> '.join(path)}")
                break
        return min_eval

def print_tree(node, depth=0):
    print("  " * depth + f"Node({node.value})")
    for child in node.children:
        print_tree(child, depth + 1)

# Example Tree
tree = Node(None, [
    Node(None, [
        Node(3),
        Node(5),
        Node(6)
    ]),
    Node(None, [
        Node(1),
        Node(2),
        Node(0)
    ]),
    Node(None, [
        Node(4),
        Node(7),
        Node(8)
    ])
])

print("Tree Structure:")
print_tree(tree)

print("\nAlpha-Beta Pruning Process:")
result = alpha_beta_pruning(tree, depth=3, alpha=float('-inf'), beta=float('inf'), maximizing_player=True)
print(f"\nOptimal Value: {result}")
