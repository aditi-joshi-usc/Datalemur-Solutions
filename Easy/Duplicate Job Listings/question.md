# Invert Binary Tree

## Problem Statement
You are given the root of a binary tree `root`. Invert the binary tree and return its root.

### Example 1:
**Input:**
```
root = [1,2,3,4,5,6,7]
```
**Output:**
```
[1,3,2,7,6,5,4]
```

### Example 2:
**Input:**
```
root = [3,2,1]
```
**Output:**
```
[3,1,2]
```

### Example 3:
**Input:**
```
root = []
```
**Output:**
```
[]
```

## Constraints:
- `0 <=` Number of nodes in the tree `<= 100`
- `-100 <= Node.val <= 100`

## Recommended Time & Space Complexity
You should aim for a solution with `O(n)` time and `O(n)` space, where `n` is the number of nodes in the tree.

## Solution

### Approach
We use a recursive depth-first approach to swap the left and right child of each node. The recursion ensures that all nodes in the tree are visited, achieving an `O(n)` time complexity.

### Code Implementation
```python
# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def invertTree(root: TreeNode) -> TreeNode:
    if not root:
        return None
    
    # Swap left and right child
    root.left, root.right = root.right, root.left
    
    # Recur for left and right subtree
    invertTree(root.left)
    invertTree(root.right)
    
    return root
```

### Complexity Analysis
- **Time Complexity:** `O(n)`, since we visit every node exactly once.
- **Space Complexity:** `O(n)`, in the worst case, due to the recursion stack in a skewed tree.

### Alternative Iterative Solution (Using Queue)
An iterative approach using a queue (BFS) can also be used:
```python
from collections import deque

def invertTreeIterative(root: TreeNode) -> TreeNode:
    if not root:
        return None
    
    queue = deque([root])
    while queue:
        node = queue.popleft()
        node.left, node.right = node.right, node.left
        
        if node.left:
            queue.append(node.left)
        if node.right:
            queue.append(node.right)
    
    return root
```

### Alternative Iterative Solution (Using Stack)
A DFS approach using a stack can also be used:
```python
def invertTreeDFS(root: TreeNode) -> TreeNode:
    if not root:
        return None
    
    stack = [root]
    while stack:
        node = stack.pop()
        node.left, node.right = node.right, node.left
        
        if node.left:
            stack.append(node.left)
        if node.right:
            stack.append(node.right)
    
    return root
```

### Summary
- **Recursive Approach:** Simple, but uses recursive stack memory.
- **Iterative BFS Approach:** Uses a queue for level-order traversal.
- **Iterative DFS Approach:** Uses a stack for depth-first traversal.

All approaches achieve the required `O(n)` time and `O(n)` space complexity.

---

# Count of Companies with Duplicate Job Listings

## Problem Statement
Retrieve the count of companies that have posted duplicate job listings on LinkedIn.

### Definition
Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.

### job_listings Table:
| Column Name  | Type    |
|-------------|--------|
| job_id      | integer |
| company_id  | integer |
| title       | string  |
| description | string  |

### Example Input:
| job_id | company_id | title           | description  |
|--------|------------|----------------|-------------|
| 248    | 827        | Business Analyst | Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations. |
| 149    | 845        | Business Analyst | Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations. |
| 945    | 345        | Data Analyst     | Data analyst reviews data to identify key insights into a business's customers and ways the data can be used to solve problems. |
| 164    | 345        | Data Analyst     | Data analyst reviews data to identify key insights into a business's customers and ways the data can be used to solve problems. |
| 172    | 244        | Data Engineer    | Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret. |

### Example Output:
| duplicate_companies |
|---------------------|
| 1                   |

### Explanation
There is one company (`company_id = 345`) that posted duplicate job listings. The duplicate listings, IDs `945` and `164`, have identical titles and descriptions.

