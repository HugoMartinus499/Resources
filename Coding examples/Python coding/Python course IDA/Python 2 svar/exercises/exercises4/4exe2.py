import tkinter as tk

window = tk.Tk()
window.title("Password saver")

canvas = tk.Canvas(window, width = 400, height = 300)
canvas.pack()

entry = tk.Entry(window) 
canvas.create_window(200, 150, window=entry)

def write_to_file(password):
    my_file = open("passwords.txt", "a")
    my_file.write(password + "\n")
    my_file.close()

def get_input(): 
    password = entry.get()
    write_to_file(password)

button = tk.Button(text='Save your password', command=get_input)
canvas.create_window(200, 180, window=button)
window.mainloop()