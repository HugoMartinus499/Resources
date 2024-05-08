import math   

x1 = 2
y1 = 7
x2 = 7
y2 = 9

distance_a_b = math.sqrt(((x2-x1)**2)+((y2-y1)**2))
print(distance_a_b)

x3 = 7
y3 = 2 

distance_b_c = math.sqrt(((x3-x2)**2)+((y3-y2)**2))

if (distance_a_b > distance_b_c):
    print("d(A,B) is largest:",distance_a_b)
else:
    print("d(B,C) is largest:",distance_b_c)
    