# Python is case sensitive
# Spacing is important in python

## Data types and operators
#Useful knowledge:
    #Data types: Integers, Floats, Booleans, Strings
    #Operators: Arithmetic, Assignment, Comparison, Logical
    #Built-In Functions, Type Conversion
    #Whitespace and Style Guidelines
#Arithmetic operators
    # +, -, *, /
    # % is mod, which is the remainder after dividing
    # ** is Exponentiation
    # // divides as rounds to nearest integer
    # ^ is a bitwise operator for XOR, this is not needed for now, can be read about here: https://wiki.python.org/moin/BitwiseOperators 

## Code with comments

print((23+32+64)/3) # average electricity bill over 3 months

print((9*7)+(5*7)) # Tiles needed for floor of 9x7 tiles and 5x7 tiles

print((17*6)-98) # Tiles left over after buying 17 packs of 6 tiles



# Variables and assignment operators
    # Variables are created using an assingment operator like "=", and it then stores whatever information comes after the assignment operator
    # This means that "=", does not mean that what's on the left side equals what is on the right side and vice versa, it assigns what is on the right side to be stored in what is on the left side
    # Multiple assignment can happen like this x,y,z = 1,2,3, it then assigns based on order
    # When assigning variables, use descriptive names, only use ordinary numbers, letters or underscores, always start with a letter or underscore, don't use spaces
    # Reserved words or built-in identifiers can't be used as variable names
    # Custom is using all lowercase letters and underscores to separate words
# Assignment operators
    # = assigns the value 
    # += reassigns the variable to itself + whatever is on the right of the operator
    # -= reassigns the variable to itself - whatever is on the right of the operator
    
## Code with comments

# The current volume of a water reservoir (in cubic metres)
reservoir_volume = 4.445e8
# The amount of rainfall from a storm (in cubic metres)
rainfall = 5e6

# decrease the rainfall variable by 10% to account for runoff
rainfall *= 0.9

# add the rainfall variable to the reservoir_volume variable
reservoir_volume += rainfall

# increase reservoir_volume by 5% to account for stormwater that flows
# into the reservoir in the days following the storm
reservoir_volume *= 1.05

# decrease reservoir_volume by 5% to account for evaporation
reservoir_volume *= 0.95

# subtract 2.5e5 cubic metres from reservoir_volume to account for water
# that's piped to arid regions.

reservoir_volume -= 2.5e5

# print the new value of the reservoir_volume variable
print(reservoir_volume)


