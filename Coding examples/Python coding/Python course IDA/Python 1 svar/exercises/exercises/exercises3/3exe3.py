import random

random_dict = {}

for i in range(20):
    random_dict[i] = random.randint(1,100)

random_avg = sum(random_dict.values()) / len(random_dict)
print(random_dict.values())
print(random_avg)
