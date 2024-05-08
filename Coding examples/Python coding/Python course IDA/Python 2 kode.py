#%%
# Importer klassen Beer fra filen med klassen
from beer import Beer

# Lav 3 objekter af klassen Beer med forskellige værdier
beer1 = Beer("Stout", 8, "Guinness")
beer2 = Beer("IPA", 6.5, "Mikkeller")
beer3 = Beer("Pilsner", 5, "Carlsberg")

# Kald print_beer metoden på de 3 objekter
beer1.print_beer()
beer2.print_beer()
beer3.print_beer()  # Output: Name: Pilsner, Percentage: 5, Brand: Carlsberg


beer3.change_percentage(4.8)
beer3.print_beer()  # Output: Name: Pilsner, Percentage: 4.8, Brand: Carlsberg

#%%
# Åbn filen og læs indholdet
with open('points.txt', 'r') as file:
    content = file.readlines()

# Opret tomme lister til x- og y-værdier
x_values = []
y_values = []

# Loop igennem linjerne i filen og tilføj x- og y-værdier til de respektive lister
for line in content:
    x, y = line.split(',')
    x_values.append(float(x))
    y_values.append(float(y))

# Udskriv listerne med x- og y-værdier
print("X-værdier:", x_values)
print("Y-værdier:", y_values)

#%%
beverages = ["Tuborg Classic", "Guinness", "1664", "Royal Classic", "Modelo"]

with open("favourite_beverage.txt", "w") as f:
    for bev in beverages:
        f.write(bev + "\n")
        
f.close()

#%%
# Bed brugeren om at skrive deres yndlingsøl
print("Skriv dine 5 yndlingsøl:")
beers = []
for i in range(5):
    beer = input(f"{i+1}. ")
    beers.append(beer)

# Gem de yndlingsøl i en fil
with open("user_fav_bev.txt", "w") as f:
    for beer in beers:
        f.write(beer + "\n")
f.close()

#%%
import matplotlib.pyplot as plt

# Læser filen ind i to lister
with open('points.txt') as f:
    data = f.readlines()
x = []
y = []
for line in data:
    x_val, y_val = line.strip().split(',')
    x.append(float(x_val))
    y.append(float(y_val))

# Plotter x og y
plt.plot(x, y, 'ro')

# Tilføjer titler til figuren og akserne
plt.title('One of Anscombe\'s quartet')
plt.xlabel('x')
plt.ylabel('y')

# Viser figuren
plt.show()

#%%

import tkinter as tk

class CelsiusConverterGUI:
    def __init__(self, master):
        self.master = master
        master.title("Celsius to Fahrenheit Converter")

        self.celsius_label = tk.Label(master, text="Degrees Celsius:")
        self.celsius_label.pack()

        self.celsius_entry = tk.Entry(master)
        self.celsius_entry.pack()

        self.convert_button = tk.Button(master, text="Convert", command=self.convert)
        self.convert_button.pack()

        self.fahrenheit_label = tk.Label(master, text="Degrees Fahrenheit:")
        self.fahrenheit_label.pack()

        self.fahrenheit_output = tk.Label(master, text="")
        self.fahrenheit_output.pack()

    def convert(self):
        celsius = float(self.celsius_entry.get())
        fahrenheit = (1.8 * celsius) + 32
        self.fahrenheit_output.config(text=str(fahrenheit))

root = tk.Tk()
my_gui = CelsiusConverterGUI(root)
root.mainloop()

#%%
import tkinter as tk

def save_password():
    password = password_entry.get()
    with open('passwords.txt', 'a') as file:
        file.write(password + '\n')
    password_entry.delete(0, tk.END)

root = tk.Tk()
root.title('Password Saver')

password_label = tk.Label(root, text='Password:')
password_label.pack()

password_entry = tk.Entry(root, show='*')
password_entry.pack()

save_button = tk.Button(root, text='Save', command=save_password)
save_button.pack()

root.mainloop()