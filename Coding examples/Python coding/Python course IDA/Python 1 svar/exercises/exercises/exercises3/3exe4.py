import random 

a = []
b = []

for i in range(3): 
    a.append(random.randint(1,10))
    b.append(random.randint(1,10))

dot_product = a[0]*b[0]+a[1]*b[1]+a[2]*b[2]
print(dot_product)
