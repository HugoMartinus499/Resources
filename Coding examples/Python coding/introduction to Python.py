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


# Integers and floats
    # Integers are whole numbers
    # Floats are decimal numbers
    # Both are data types, every object has a type in python
    # The type of an object can be check with the built-in function "type"
    # Converting a float to an interger using int in the print function, it cuts of the number after the decimal point, meaning no rounding

# Best practices for python coding: https://peps.python.org/pep-0008/

# Booleans, comparison operators and logical operators
    # Booleans are True or False
    # Comparison operators are >,<,==,!=, >=, <=
    # Logical operators are "and", "or", "not"
    
## Code with comments
sf_population, sf_area = 864816, 231.89
rio_population, rio_area = 6453682, 486.5

san_francisco_pop_density = sf_population/sf_area
rio_de_janeiro_pop_density = rio_population/rio_area

# Write code that prints True if San Francisco is denser than Rio, and False otherwise
print(san_francisco_pop_density > rio_de_janeiro_pop_density)

# Alternative solution using if statement, however, the one above is more concise and efficient
if (san_francisco_pop_density > rio_de_janeiro_pop_density):
    print (True)
else:
    print (False)

# Strings
    # String are an immutable ordered series of characters
    # Can be created using quotes, both double and single work
    # If needing to make a quote within a quote, use double for one and single the other
    # If both are used, make a \ before the quote within the string to get around syntax error
    # Strings can be added or multiplied, but spaces need to be explicit in a string like " "
    # The function len can be used to check the length of a string
    
#Code with comments
# TODO: Fix this string!
ford_quote = "Whether you think you can, or you think you can't--you're right."

username = "Kinari"
timestamp = "04:50"
url = "http://petshop.com/pets/mammals/cats"

# TODO: print a log message using the variables above.
# The message should have the same format as this one:
# "Yogesh accessed the site http://petshop.com/pets/reptiles/pythons at 16:20."

print (username + " accessed the site " + url + " at " + timestamp + ".")

# OR

message = username + " accessed the site " + url + " at " + timestamp + "."
print(message)

# length
given_name = "William"
middle_names = "Bradley"
family_name = "Pitt"

name_length = len(given_name) + len(middle_names) + len(family_name) +2 #todo: calculate how long this name is

# Now we check to make sure that the name fits within the driving license character limit
# Nothing you need to do here
driving_license_character_limit = 28
print(name_length <= driving_license_character_limit)

## Type and type conversion
    # Paranthesis determine order that functions are run, eg. print(type(633))
    # Each data type has different functions
    # Types can be changed using type change functions
    
# Calculate total weekly sales and display it
# My solution (spelt out)

mon_sales = "121"
tues_sales = "105"
wed_sales = "110"
thurs_sales = "98"
fri_sales = "95"

#TODO: Print a string with this format: This week's total sales: xxx
# You will probably need to write some lines of code before the print statement.

statement = "This week's total sales:" # write statement for print function

# Convert all sales from string to integer
mon_sales = int(mon_sales) 
tues_sales = int(tues_sales)
wed_sales = int(wed_sales)
thurs_sales = int(thurs_sales)
fri_sales = int(fri_sales)
    
total_sales = mon_sales + tues_sales + wed_sales + thurs_sales + fri_sales # Add sales together

print(statement + " " + str(total_sales)) # Print statement + space + total sales as str

# Alternative solution in less code
weekly_sales = int(mon_sales) + int(tues_sales) + int(wed_sales) + int(thurs_sales) + int(fri_sales)
weekly_sales = str(weekly_sales)  #convert the type back!!
print("This week's total sales: " + weekly_sales)
    