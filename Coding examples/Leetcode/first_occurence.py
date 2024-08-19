# Using find() function
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        x = haystack.find(needle)
        return x
    
# Using loop
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        for i in range(len(haystack) - len(needle) + 1):
            if haystack[i:i+len(needle)] == needle:
                return i
        return -1