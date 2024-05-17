## Solutions for leetcode climbStairs

# Recursive solution
class Solution:
    def climbStairs(self, n: int) -> int:
        if n <= 1:
            return 1
        else:
            return self.climbStairs(n-1) + self.climbStairs(n-2)

# Define list of zeros, add base cases indexes, loop over indexes        
class Solution:
    def climbStairs(self, n: int) -> int:
        l = [0 for _ in range(n+1)]
        l[0] = 1
        l[1] = 1
        for i in range(2,n+1):
            l[i] = l[i-1] + l[i-2]
        return l[n]

# Another way to define a zero list    
class Solution:
    def climbStairs(self, n: int) -> int:
        l = [0]*(n+1)
        l[0] = 1
        l[1] = 1
        for i in range(2,n+1):
            l[i] = l[i-1] + l[i-2]
        return l[n]

# Only save the last two outputs, to make code faster    
class Solution:
    def climbStairs(self, n: int) -> int:
        if n <= 3:
            return n

        N_1 = 3
        N_2 = 2
        current = 0

        for i in range(3, n):
            cur = N_1 + N_2
            N_2 = N_1
            N_1 = cur

        return cur