# Good idea, but hinders further work
alphabet = 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z'
split_alphabet = alphabet.split(",")

dict = {}
dict['a'] = 1

for i in range(1, len(split_alphabet)):
    dict.update({split_alphabet[i]: i})
    
print(dict)
print(split_alphabet)

# Accepted solution
class Solution:
    def getLucky(self, s: str, k: int) -> int:
        numeric = '' # Create empty string for numbers

        for i in s:
            numeric += str(ord(i) - ord('a') + 1) # Order and convert s into numbers

        while k > 0: 
            temp = 0 # Create temporary number holder

            for i in numeric:
                temp += int(i) # Sum the digits of the numeric string

            numeric = str(temp) # Redefine numeric string into the string version of temp
            k -= 1 # Remove 1 value from k, to control a stop point of while loop
        return int(numeric) # return summed number