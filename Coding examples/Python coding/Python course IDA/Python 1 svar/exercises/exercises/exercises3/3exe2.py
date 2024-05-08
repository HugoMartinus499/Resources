
tmp = [1,3,6,2,5]

# hard way: 
numbers_sum = 0
for i in tmp: 
    numbers_sum += i
print(numbers_sum/len(tmp))

# easy way: 
print(sum(tmp)/len(tmp))
