# My solution
class Solution:
    def isPalindrome(self, s: str) -> bool:
        s = ''.join(i for i in s if i.isalnum()) # Remove all non-alphanumeric charcters by checking with .isalnum()
        return str(s.lower()) == str(s.lower())[::-1] # Convert to lowercase with .lower() and reverse string