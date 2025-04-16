import heapq

def createGraph():
    graph = {}
    n = int(input("Enter the number of nodes: "))
    print("Enter the node and Adjacent node with cost in the following format:")
    print("node:adjacentNode1,cost1;adjacentNode2,cost2;...")
    for _ in range(n):
        node_input = input().split(":")
        node = node_input[0].strip()
        if len(node_input) > 1 and node_input[1]:
            graph[node] = [(adj.split(",")[0].strip(), int(adj.split(",")[1])) for adj in node_input[1].split(";")]
        else:
            graph[node] = []
    return graph

def BFS(graph, start, dest):
    queue = [start]
    visited = set()
    parent = {start: None}
    cost = {start: 0}
    result = ["Not reachable", [], 0]

    while queue:
        node = queue.pop(0)
        visited.add(node)
        print('Visited', node)

        if node == dest:
            result[0] = 'Reachable'
            break

        for child, path_cost in graph.get(node, []):
            if child not in visited and child not in queue:
                queue.append(child)
                parent[child] = node
                cost[child] = cost[node] + path_cost

    if result[0] == 'Reachable':
        path = []
        while dest:
            path.append(dest)
            dest = parent[dest]
        path.reverse()
        result[1] = path
        result[2] = cost[path[-1]]
    else:
        result[1] = list(visited)
    return result

def DFS(graph, start, dest):
    stack = [start]
    visited = set()
    parent = {start: None}
    cost = {start: 0}
    result = ["Not reachable", [], 0]

    while stack:
        node = stack.pop()
        if node in visited:
            continue
        visited.add(node)
        print('Visited', node)

        if node == dest:
            result[0] = 'Reachable'
            break

        for child, path_cost in reversed(graph.get(node, [])):
            if child not in visited:
                stack.append(child)
                parent[child] = node
                cost[child] = cost[node] + path_cost

    if result[0] == 'Reachable':
        path = []
        while dest:
            path.append(dest)
            dest = parent[dest]
        path.reverse()
        result[1] = path
        result[2] = cost[path[-1]]
    else:
        result[1] = list(visited)
    return result

def UCS(graph, start, dest):
    pq = [(0, start)]
    visited = set()
    parent = {start: None}
    cost = {start: 0}
    result = ["Not reachable", [], 0]

    while pq:
        current_cost, node = heapq.heappop(pq)
        if node in visited:
            continue
        visited.add(node)
        print('Visited', node)

        if node == dest:
            result[0] = 'Reachable'
            break

        for child, path_cost in graph.get(node, []):
            new_cost = current_cost + path_cost
            if child not in cost or new_cost < cost[child]:
                cost[child] = new_cost
                parent[child] = node
                heapq.heappush(pq, (new_cost, child))

    if result[0] == 'Reachable':
        path = []
        while dest:
            path.append(dest)
            dest = parent[dest]
        path.reverse()
        result[1] = path
        result[2] = cost[path[-1]]
    else:
        result[1] = list(visited)
    return result

def best_first_search(graph, start, dest, heuristic):
    priority_queue = [(heuristic[start], 0, start)] # Priority queue for (f_score, g_n, node)
    visited = set()
    parent = {start: None}
    cost = {start: 0} # Cost from start to node
    result = ["Not reachable", [], 0]   # Initialize result as "Not reachable", empty path, and cost 0

    while priority_queue:
        _, current_cost, node = heapq.heappop(priority_queue) # Pop the node with the lowest f_score
        if node in visited:
            continue
        visited.add(node) #
        print('Visited', node) # Mark the node as visited

        if node == dest:
            result[0] = 'Reachable' # If the destination is reached, update result
            break

        for child, path_cost in graph.get(node, []): # Iterate through neighbors
            new_cost = current_cost + path_cost   # Calculate new cost
            if child not in cost or new_cost < cost[child]:  # Update cost if it's lower
                cost[child] = new_cost  # Update cost dictionary
                parent[child] = node
                heapq.heappush(priority_queue, (heuristic[child], new_cost, child))  # Push to priority queue with heuristic

    if result[0] == 'Reachable':
        path = []   # Construct the path from start to destination
        while dest:
            path.append(dest) # Append the current node to the path
            dest = parent[dest]  # Move to the parent node
        path.reverse()    # Reverse the path to get the correct order
        result[1] = path   # Update the path in result
        result[2] = cost[path[-1]]   # Update the cost in result
    else:
        result[1] = list(visited)
    return result

def a_star(graph, start, dest, heuristic):
    priority_queue = [(heuristic[start], 0, start)]   # Priority queue for (f_score, g_n, node)
    parent = {start: None} # Parent dictionary to reconstruct the path
    cost = {start: 0}
    visited = set()
    result = ["Not reachable", [], 0]

    while priority_queue:
        f_n, g_n, node = heapq.heappop(priority_queue)  # Pop the node with the lowest f_score
        if node in visited:  
            continue
        visited.add(node)
        print("Visited", node)

        if node == dest:
            result[0] = "Reachable"  # If the destination is reached, update result
            break

        for neighbor, path_cost in graph.get(node, []):
            new_cost = g_n + path_cost  # Calculate new cost from start to neighbor
            if neighbor not in cost or new_cost < cost[neighbor]:   # Update cost if it's lower
                cost[neighbor] = new_cost   # Update cost dictionary
                parent[neighbor] = node  # Update parent dictionary
                f_n = new_cost + heuristic[neighbor]   # Calculate f_score
                heapq.heappush(priority_queue, (f_n, new_cost, neighbor)) # Push to priority queue

    if result[0] == "Reachable":  # If the destination is reachable
        path = []  # Construct the path from start to destination
        while dest:  # Append the current node to the path
            path.append(dest) # Move to the parent node
            dest = parent[dest]  # Move to the parent node
        path.reverse()  # Reverse the path to get the correct order
        result[1] = path  # Update the path in result
        result[2] = cost[path[-1]]  # Update the cost in result
    else:
        result[1] = list(visited)   # If not reachable, return visited nodes
    return result   # End of function

# Main
graph = createGraph()
start = input("Enter the start node: ")
dest = input("Enter the destination node: ")

print("\nBFS Result:")
print(BFS(graph, start, dest))

print("\nDFS Result:")
print(DFS(graph, start, dest))

print("\nUCS Result:")
print(UCS(graph, start, dest))

heuristic = {node: int(input(f"Enter heuristic value for {node}: ")) for node in graph.keys()}

print("\nBest First Search Result:")
print(best_first_search(graph, start, dest, heuristic))

print("\nA* Search Result:")
print(a_star(graph, start, dest, heuristic))
