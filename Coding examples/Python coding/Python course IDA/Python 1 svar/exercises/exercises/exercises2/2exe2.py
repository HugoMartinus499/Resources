def calculate_promille(units, body_weight): 
    return (units*12)/(body_weight*0.7)

while True: 
    print("Please enter how many beers you have consumed")
    units_input = input()
    print("Please enter your body weight")
    weight_input = input()
    print("Your blood alcohol content (promille) is: ")
    promille = calculate_promille(int(units_input), int(weight_input))
    print(promille)
    