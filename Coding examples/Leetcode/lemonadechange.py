# First attempt at solution, fails by returning true, when correct change is not given
class Solution:
    def lemonadeChange(self, bills: List[int]) -> bool:
        change = []

        for bill in bills:
            if bill == 5:
                change.append(bill)
            elif bill != 5 and 5 in change:
                change.append(bill) and change.remove(5)
            else:
                return False
        return True    
    

# Accepted solution 1
class Solution:
    def lemonadeChange(self, bills: List[int]) -> bool:
        if bills[0] != 5:
            return False

        Five_dollar_bills, Ten_dollar_bills = 0, 0
        

        for bill in bills:
            if bill == 5:
                Five_dollar_bills += 1
            elif bill == 10:
                if Five_dollar_bills > 0:
                    Five_dollar_bills -= 1
                else:
                    return False
                Ten_dollar_bills += 1
            else:
                if Five_dollar_bills > 0 and Ten_dollar_bills > 0:
                    Five_dollar_bills -= 1
                    Ten_dollar_bills -= 1
                elif Five_dollar_bills > 2:
                    Five_dollar_bills -= 3
                else:
                    return False
        return True  
    
# Slightly faster, alternative solution
class Solution:
    def lemonadeChange(self, bills: List[int]) -> bool:

        Five_dollar_bills, Ten_dollar_bills = 0, 0
        

        for bill in bills:
            if bill == 5:
                Five_dollar_bills += 1
            elif bill == 10:
                Five_dollar_bills -= 1
                Ten_dollar_bills += 1
            elif Ten_dollar_bills > 0:
                Ten_dollar_bills -= 1
                Five_dollar_bills -= 1
            else:
                Five_dollar_bills -= 3
            
            if Five_dollar_bills < 0:
                return False
        return True   