# hardcoded, fails when parenthesis aren't directly after each other
class Solution:
    def isValid(self, s: str) -> bool:
        for i in range(len(s)):
            if s[i] == "(" and s[i+1] == ")":
                return True
            elif s[i] == "[" and s[i+1] == "]":
                return True
            elif s[i] == "{" and s[i+1] == "}":
                return True
            else:
                return False
            
# Using a stack
class Solution:
    def isValid(self, s: str) -> bool:
        stack = [] # Creating stack to hold opening brackets

        for i in s:
            if i in "([{": # If i is an opening bracket
                stack.append(i) 
            else: # If i is a closing bracket
                if not stack or \
                    (i == ')' and stack[-1] != '(') or \
                    (i == '}' and stack[-1] != '{') or \
                    (i == ']' and stack[-1] != '['):
                    return False # Return False if i is a closing bracket and the last character in stack is not the corresponding opening bracket
                stack.pop() # Remove the opening bracket from stack if match is found
        return not stack # if the stack is empty, all opening brackets have been matched with their corresponding closing brackets, so the string is valid, otherwise, there are unmatched opening brackets, so return false
    
# \ is telling python to extend the logical line to the next physical line.
# Instead of writing: if not stack or (i == ')' and stack[-1] != '(') or (i == '}' and stack[-1] != '{') or (i == ']' and stack[-1] != '['):