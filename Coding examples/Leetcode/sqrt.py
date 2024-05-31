# My answer
class Solution:
    def mySqrt(self, x: int) -> int:
        i = 0
        while i*i < x:
            i += float(0.1)
        return int(i)
# Didn't pass submit

# Better, faster solution
# Starts by assuming i = x and then iterates closer until it finds the actual sqrt
class Solution:
    def mySqrt(self, x: int) -> int:
        i = x
        while i * i > x:
            i = (i + x // i) // 2 # // is floor division, meaning that it will always return the lowest integer that the float is close to
        return i