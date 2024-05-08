import matplotlib.pyplot as plt

x = []
y = []

with open('points.txt') as f:
    for line in f:
        points = line.split(",")
        x.append(float(points[0]))
        y.append(float(points[1]))

plt.plot(x,y,'ro')
plt.show()