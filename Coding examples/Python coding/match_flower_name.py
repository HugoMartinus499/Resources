# Write your code here
def create_flowerdict(filename):
    flowerdict = {}
    with open (filename, 'r') as f:
        for line in f:
            letter = line.split(": ")[0].lower()
            flower = line.split(": ")[1].strip()
            flowerdict[letter] = flower
    return flowerdict

def main():
    flower_d = create_flowerdict('Data/flowers.txt')
    full_name = input("Write your First [Space] Last name only: ")
    firstname = full_name[0].lower()
    first_letter = firstname[0]
    
    print(f"Your flowername is {flower_d[first_letter]}")
# HINT: create a dictionary from flowers.txt
# HINT: create a function to ask for user's first and last name

# print the desired output
main()