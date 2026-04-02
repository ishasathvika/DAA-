def tsp_backtracking(graph, visited, curr_pos, n, count, cost, ans):
    # If all cities visited and return path exists
    if count == n and graph[curr_pos][0] > 0:
        ans[0] = min(ans[0], cost + graph[curr_pos][0])
        return

    for i in range(n):
        if not visited[i] and graph[curr_pos][i] > 0:
            visited[i] = True

            tsp_backtracking(
                graph,
                visited,
                i,
                n,
                count + 1,
                cost + graph[curr_pos][i],
                ans
            )

            visited[i] = False  # backtrack


def solve_tsp(graph):
    n = len(graph)
    visited = [False] * n
    visited[0] = True  # start from city 0
    ans = [float('inf')]

    tsp_backtracking(graph, visited, 0, n, 1, 0, ans)
    return ans[0]


n = int(input("Enter number of cities: "))

print("Enter the adjacency matrix:")
graph = []
for i in range(n):
    row = list(map(int, input().split()))
    graph.append(row)

result = solve_tsp(graph)

print("Minimum travelling cost:", result)
