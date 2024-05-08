#%%
import math
import numpy
import random


#%%
i = 0
for i in range(20):
    if i <= 10:
        print("Hej Hugo")
    else:
        print ("Jeg elsker Ceres Top")
        
#%%               
celsius = 20
fahrenheit = (celsius * 9/5) + 32
print(f"{celsius} grader Celsius er {fahrenheit} grader Fahrenheit")

celsius_again = (fahrenheit - 32) * 5/9
print(f"{fahrenheit} grader Fahrenheit er {celsius_again} grader Celsius")

#%%
# koordinater for punkt A
x1 = 2
y1 = 7

# koordinater for punkt B
x2 = 7
y2 = 9

# beregn afstanden mellem punkterne A og B
distance = math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

# print resultatet
print(f"Afstanden mellem punkt A({x1},{y1}) og punkt B({x2},{y2}) er {distance:.2f}")

#%%
# koordinater for punkt C
x3 = 7
y3 = 2

# beregn afstanden mellem punkterne B og C
distance_BC = math.sqrt((x3 - x2)**2 + (y3 - y2)**2)

# beregn afstanden mellem punkterne A og B
distance_AB = math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

# sammenlign afstandene og print resultatet
if distance_BC > distance_AB:
    print(f"Afstanden mellem punkt B({x2},{y2}) og punkt C({x3},{y3}) er større end afstanden mellem punkt A({x1},{y1}) og punkt B({x2},{y2}) med {distance_BC - distance_AB:.2f}")
elif distance_AB > distance_BC:
    print(f"Afstanden mellem punkt A({x1},{y1}) og punkt B({x2},{y2}) er større end afstanden mellem punkt B({x2},{y2}) og punkt C({x3},{y3}) med {distance_AB - distance_BC:.2f}")
else:
    print("Afstanden mellem punkt A og B er lig med afstanden mellem punkt B og C")
    
    
#%%
def celsius_to_fahrenheit(celsius_degrees):
    fahrenheit_degrees = celsius_degrees * 9/5 + 32
    return fahrenheit_degrees

# lad brugeren indtaste en temperatur i Celsius
celsius = float(input("Indtast temperaturen i Celsius: "))

# konverter til Fahrenheit ved hjælp af vores metode
fahrenheit = celsius_to_fahrenheit(celsius)

# udskriv resultatet
print(f"{celsius:.1f} grader Celsius er {fahrenheit:.1f} grader Fahrenheit")

#%%
def beregn_promille(alkohol, vægt, køn, timer):
    r = 0.68 if køn == 'm' else 0.55
    promille = (alkohol * 12 * r / vægt) - (0.15 * timer)
    return promille



while True:
    antal_genstande = int(input("Hvor mange genstande har du drukket? "))
    alkohol = antal_genstande * 12  # 1 genstand indeholder ca. 12 gram alkohol

    vægt = float(input("Hvad er din vægt i kg? "))
    køn = input("Er du mand eller kvinde (m/k)? ")
    timer = float(input("Hvor mange timer er der gået siden din første genstand? "))

    promille = beregn_promille(alkohol, vægt, køn, timer)
    print(f"Din promille er {promille:.2f}")

    fortsæt = input("Vil du beregne din promille igen? (ja/nej) ")
    if fortsæt.lower() != 'ja':
        break

#%%
def is_equal(number):
    if number % 2 == 0:
        return True
    else:
        return False
    
tal = int(input("Indtast et heltal: "))
if is_equal(tal):
    print(f"{tal} er lige")
else:
    print(f"{tal} er ulige")
    
#%%
# Opret en tom liste
my_list = []

# Tilføj 20 tilfældige tal til listen
for i in range(20):
    tal = random.randint(1, 100)
    my_list.append(tal)

# Udskriv listen
print(my_list)

#%%
def udregn_gennemsnit(liste):
    summen = sum(liste)
    antal = len(liste)
    gennemsnit = summen / antal
    return gennemsnit

# Eksempel på brug
gennemsnit = udregn_gennemsnit(my_list)
print(f"Gennemsnittet af tallene {tal} er {gennemsnit}")

#%%
# Opret et tomt dictionary
my_dict = {}

# Tilføj 20 tilfældige tal mellem 1 og 100 som values til dictionary'et, hvor key er tallet fra 0 til 19
for i in range(20):
    my_dict[i] = random.randint(1, 100)

# Udregn gennemsnittet af alle values i dictionary'et
gennemsnit = sum(my_dict.values()) / len(my_dict)

# Udskriv dictionary'et og gennemsnittet
print(f"Dictionary: {my_dict}")
print(f"Gennemsnit af values: {gennemsnit}")

#%%
# Funktion der udregner prikprodukt
def prikprodukt(a, b):
    """Udregn prikproduktet mellem to vektorer"""
    return sum(ai * bi for ai, bi in zip(a, b))

# Generer to 3D-vektorer a og b med tilfældige værdier
a = [random.randint(1, 10) for i in range(3)]
b = [random.randint(1, 10) for i in range(3)]

# Udregn prikproduktet mellem a og b
prik = prikprodukt(a, b)

# Udskriv resultatet
print(f"Vektor a: {a}")
print(f"Vektor b: {b}")
print(f"Prikprodukt: {prik}")



