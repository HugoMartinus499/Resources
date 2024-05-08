import tkinter as tk

window = tk.Tk()

def print_hello_world(): 
    print("hello world")

button = tk.Button(window, text="Press here", command = print_hello_world)
button.pack()
window.mainloop()