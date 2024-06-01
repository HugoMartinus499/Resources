# My solution initial solution that didn't work
class Solution:
    def scoreOfString(self, s: str) -> int:
        ans = 0
        for i in s:
            ans += s[i] - s[i+1]

        return ans
    
# Corrected solution
class Solution:
    def scoreOfString(self, s: str) -> int:
        ans = 0
        for i in range(1, len(s), 1):
            ans += abs(ord(s[i-1]) - ord(s[i]))# abs() returns the absolute value, ord() returns the integer that corresponds to that character

        return ans