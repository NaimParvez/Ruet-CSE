from collections import deque

def build_tree():
    tree = {}
    n = int(input("Enter the number of edges: "))
    print("Enter edges in the format 'parent child cost':")
    for _ in range(n):
        parent, child, cost = input().split()
        cost = int(cost)
        if parent not in tree:
            tree[parent] = []
        tree[parent].append((child, cost))
    return tree

def print_tree(tree):
    print("\nTree structure:")
    for parent in tree:
        for child, cost in tree[parent]:
            print(f"{parent} --[{cost}]--> {child}")

def bfs_cost_tree(tree, root, goal):
    queue = deque([(root, [root], 0)])
    
    while queue:
        current_node, path, total_cost = queue.popleft()
        
        if current_node == goal:
            return True, path, total_cost
        
        if current_node in tree:
            for neighbor, cost in tree[current_node]:
                if neighbor not in path:  # Prevent cycles
                    new_path = path.copy()
                    new_path.append(neighbor)
                    queue.append((neighbor, new_path, total_cost + cost))
                    print(queue)
    
    return False, [], 0

def main():
  
    tree = build_tree()
    root = input("\nEnter root node: ")
    goal = input("Enter goal node: ")
    
    print_tree(tree)
    
    print("\nSearching for path...")
    found, path, cost = bfs_cost_tree(tree, root, goal)
    
    if found:
        print(f"\nPath found: {' -> '.join(path)}")
        print(f"Total cost to reach {goal}: {cost}")
    else:
        print(f"\nGoal node {goal} is not reachable from {root}")

if __name__ == "__main__":
    main()
    

'''
edges: 10
S A 2
S B 1
S C 3
A E 1
A F 1
B G 2
C D 5
E H 2
F G 1
H G 1
'''