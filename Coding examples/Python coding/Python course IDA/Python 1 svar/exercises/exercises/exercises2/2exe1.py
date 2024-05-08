def celsius_to_fahrenheit(celsius_degrees): 
    fahrenheit_degrees = (1.8 * celsius_degrees) + 32
    return fahrenheit_degrees

celsius_input = input()
print(celsius_to_fahrenheit(int(celsius_input)))
