# My solution
class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        return len(s.split()[-1]) # Split string and take length of the last word