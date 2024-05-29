class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        com = "" # Assign case for if no matching prefix
        strs = sorted(strs) # Sort list of strings
        first = strs[0] # Assign index of first string in list
        last = strs[-1] # Assign index of last string in list
        
        for i in range(min(len(first), len(last))): # Iterate through characters of first and last string in list, stops at the length of the shorter string
            if first[i] != last[i]: # Checking if current character of first string is not equal to same character in last string. 
                return com # If they are not equal, it returns the prefix found so far.
            com += first[i] # If they are equal, append the current character to the com string, which contains the prefix
        return(com) # returning the longest common prefix