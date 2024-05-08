males = []
females = []

with open('couples.txt') as f:
    for line in f:
        couples = line.split(",")
        males.append(couples[0])
        females.append(couples[1].rstrip())

