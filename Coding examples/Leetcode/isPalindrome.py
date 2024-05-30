# My solution
class Solution:
    def isPalindrome(self, x: int) -> bool:
        x = str(x) # Convert int to string
        if x == x[::-1]: # The colons are separators. Rather than providing a "beginning" and an "end" index, it's telling Python to skip by every -1 objects in the array. It's effectively reversing the array.
            return True
        return False
    
# Alternative, faster solution
class Solution:
    def isPalindrome(self, x: int) -> bool:
        return str(x) == str(x)[::-1] # Compresses everything into one line