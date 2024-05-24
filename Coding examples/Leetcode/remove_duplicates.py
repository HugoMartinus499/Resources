## Solutions for leetcode "Remove duplicates from sorted array"
# Accepted solution in leetcode
class Solution:
    def removeDuplicates(self, nums: list[int]) -> int:
        k = 1
        for num in range(1, len(nums)):
            if nums[num] != nums[num - 1]:
                nums[k] = nums[num]
                k += 1
        return k
    
# Explanation:
# The code starts iterating from num = 1 because we need to compare each element with its previous element to check for duplicates.

# The main logic is inside the for loop:

# If the current element nums[num] is not equal to the previous element nums[num - 1], it means we have encountered a new unique element.
# In that case, we update nums[k] with the value of the unique element at nums[num], and then increment k by 1 to mark the next position for a new unique element.
# By doing this, we effectively overwrite any duplicates in the array and only keep the unique elements.
# Once the loop finishes, the value of k represents the length of the resulting array with duplicates removed.

# Finally, we return k as the desired result.

# Solution proposed, but not accepted
def removeDuplicates(nums: list[int]) -> int:
    k = len(set(nums))
    return k
print(removeDuplicates(nums = [1,1,2]))
print(removeDuplicates(nums = [0,0,1,1,1,2,2,3,3,4]))

nums = [1,1,2]    
print(list(set(nums)))

nums = [0,0,1,1,1,2,2,3,3,4]
print(list(set(nums)))

# This works here, but for some reason not in leetcode