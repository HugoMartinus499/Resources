import tkinter as tk

window = tk.Tk()
window.title("Degree converter")

canvas = tk.Canvas(window, width = 400, height = 300)
canvas.pack()

entry = tk.Entry(window) 
canvas.create_window(200, 150, window=entry)

def get_fahrenheit():  
    celsius = entry.get()
    fahrenheit = (float(celsius) * 1.8) + 32
    label1 = tk.Label(window, text= fahrenheit)
    canvas.create_window(200, 210, window=label1)

button = tk.Button(text='Get the degrees in fahrenheit', command=get_fahrenheit)
canvas.create_window(200, 180, window=button)
window.mainloop()