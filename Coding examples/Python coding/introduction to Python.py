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
 
## Methods
    # Methods are related to functions
    # Associated to specific types of objects, unlike functions
    # Used with arguments
    # The object is always the first argument
 
# Browse the complete list of string methods at:
# https://docs.python.org/3/library/stdtypes.html#string-methods
# and try them out here

print(13.37.islower())   # This returns an error, as it is a string method and 13.37 is a float

# Write two lines of code below, each assigning a value to a variable
Employee = "Hugo"
Value = "250"

# Now write a print statement using .format() to print out a sentence and the 
#   values of both of the variables

print("{} just won a deal worth {}$".format(Employee,Value))

##Questions
# What is the length of the string variable verse?
# What is the index of the first occurrence of the word 'and' in verse?
# What is the index of the last occurrence of the word 'you' in verse?
# What is the count of occurrences of the word 'you' in the verse?

verse = "If you can keep your head when all about you\n  Are losing theirs and blaming it on you,\nIf you can trust yourself when all men doubt you,\n  But make allowance for their doubting too;\nIf you can wait and not be tired by waiting,\n  Or being lied about, don’t deal in lies,\nOr being hated, don’t give way to hating,\n  And yet don’t look too good, nor talk too wise:"
print(verse)

# Use the appropriate functions and methods to answer the questions above
# Bonus: practice using .format() to output your answers in descriptive messages!
verse = "If you can keep your head when all about you\n  Are losing theirs and blaming it on you,\nIf you can trust yourself when all men doubt you,\n  But make allowance for their doubting too;\nIf you can wait and not be tired by waiting,\n  Or being lied about, don’t deal in lies,\nOr being hated, don’t give way to hating,\n  And yet don’t look too good, nor talk too wise:"
print(verse, "\n")

# What is the length of the string variable verse?
print("Verse has a length of {} characters.".format(len(verse)))
# What is the index of the first occurrence of the word 'and' in verse?
print("The first occurence of the word 'and' occurs at the {}th index.".format(verse.find('and')))
# What is the index of the last occurrence of the word 'you' in verse?
print("The last occurence of the word 'you' occurs at the {}th index.".format(verse.rfind('you')))
# What is the count of occurrences of the word 'you' in the verse?
print("The word 'you' occurs {} times in the verse.".format(verse.count('you')))

# Alternative solution
verse = "If you can keep your head when all about you\n  Are losing theirs and blaming it on you,\nIf you can trust yourself when all men doubt you,\n  But make allowance for their doubting too;\nIf you can wait and not be tired by waiting,\n  Or being lied about, don’t deal in lies,\nOr being hated, don’t give way to hating,\n  And yet don’t look too good, nor talk too wise:"
print(verse, "\n")

message = "Verse has a length of {} characters.\nThe first occurence of the \
word 'and' occurs at the {}th index.\nThe last occurence of the word 'you' \
occurs at the {}th index.\nThe word 'you' occurs {} times in the verse."

length = len(verse)
first_idx = verse.find('and')
last_idx = verse.rfind('you')
count = verse.count('you')

print(message.format(length, first_idx, last_idx, count))

## Data Structures
    # Lists: Mutable ordered sequence of elements, defined using [] and separated by commas
    # Slicing is accessing a subset of a list, using [:], the lower bound is inclusive while the upper bound is exclusive
    # Membership operators evaluate the membership of the statement to the left relative to the statement of the right
        #Example. In, 'her' in "Hello There"
    # List can hold any type of object, lists can be changed by index, meaning it is mutable
    # Mutability is the ability to change the object
    # Ordered is when an object has a specific order. Meaning that the position of an element can be used to access it
    
## Code

# Indexing month
month = 8
days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]

# use list indexing to determine the number of days in month
num_days = days_in_month[month - 1]

print(num_days)

#Slicing recent dates
eclipse_dates = ['June 21, 2001', 'December 4, 2002', 'November 23, 2003',
                 'March 29, 2006', 'August 1, 2008', 'July 22, 2009',
                 'July 11, 2010', 'November 13, 2012', 'March 20, 2015',
                 'March 9, 2016']
                 
                 
# TODO: Modify this line so it prints the last three elements of the list
print(eclipse_dates[-3:])


## List functions
    # len() gives the length of the list, ie. how many elements are in the list
    # max() gives the greatest element, meaning highest number, last element in alphabetical order (Largest letter)
    # max() can't be used on lists with different data types like int or str
    # min() is the opposite of max and returns the smallest element
    # sorted() returns the complete list, but it is ordered from smallest to largest
    # sorted() can return largest to smallest using reverse = True
    # join() is a string method that takes a list of strings as an argument, and returns a string consisting of the list elements joined by a separator string.
    # join() can only be used on lists with strings
    # append() adds elements to the end of a list
    
## Code
# Finding the max and minumum lengths of three lists
a = [1, 5, 8]
b = [2, 6, 9, 10]
c = [100, 200]

print(max([len(a), len(b), len(c)]))
print(min([len(a), len(b), len(c)]))

# Joining and sorting strings in a list
names = ["Carol", "Albert", "Ben", "Donna"]
print(" & ".join(sorted(names)))

# Appending an element and sorting a list of strings
names = ["Carol", "Albert", "Ben", "Donna"]
names.append("Eugenia")
print(sorted(names))

# Indexing and slicing a list
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']

print(arr[0]) # First element
print(arr[3]) # Fourth element
print(arr[len(arr) - 1]) # Last element
print(arr[-2]) # Second to last element

print(arr[2:6]) # c, d, e, f
print(arr[:3]) # a, b, c
print(arr[4:]) # e, f, g

## Data structures
    # Tuples: immutable ordered sequences of elements
    # Can be sliced and indexed like a list
    # Used to store related information, that will always be used together like latitude and longitude
    # Paranthesis are not necessary when defining tuples
    # Tuple unpacking is assigning elements of a tuple to different variables at once, like this: 

dimensions = 52, 40, 100
length, width, height = dimensions
print("The dimensions are {} x {} x {}".format(length, width, height))

    # If we don't need dimension directly, we can omit it and just assign the values directly:

length, width, height = 52, 40, 100
print("The dimensions are {} x {} x {}".format(length, width, height))

## Data structures
    # Sets: A datatype for mutable unordered collections of unique elements
    # Set removes the duplicates of a list
    # supports the 'in' method
    # uses add method instead of append()
    # Defined using {} and seperated by commas
    # pop() removes random element, as sets are unordered
    # Example:

fruit = {"apple", "banana", "orange", "grapefruit"}  # define a set

print("watermelon" in fruit)  # check for element

fruit.add("watermelon")  # add an element
print(fruit)

print(fruit.pop())  # remove a random element
print(fruit)
    
## Data structures
    # Dictonaries is a mutable data type that stores mappings of unique keys to values. Here's a dictionary that stores elements and their atomic numbers.
    # Get can be used to find keys in the dictonaries
    # identity operators like is and is not can be used to check if a key returns eg. none or the opposite
    
elements = {"hydrogen": 1, "helium": 2, "carbon": 6}

print(elements["helium"])  # print the value mapped to "helium"
elements["lithium"] = 3  # insert "lithium" with a value of 3 into the dictionary

print("carbon" in elements)
print(elements.get("dilithium"))

n = elements.get("dilithium")
print(n is None)
print(n is not None)

# Define a Dictionary, population,
# that provides information
# on the world's largest cities.
# The key is the name of a city
# (a string), and the associated
# value is its population in
# millions of people.

#   Key     |   Value
# Shanghai  |   17.8
# Istanbul  |   13.3
# Karachi   |   13.0
# Mumbai    |   12.5

population = {'Shanghai': 17.8, 'Istanbul': 13.3, 'Karachi': 13.0, 'Mumbai': 12.5}

# Printing some statements to explore
print(population)
print(population['Istanbul'])
print('Shanghai' in population)
print(population.get('Copenhagen'))
print(population['Amsterdam']) # Results in KeyError

# Checking equality and identity operators
a = [1, 2, 3]
b = a
c = [1, 2, 3]

print(a == b) # True
print(a is b) # True
print(a == c) # True
print(a is c) # False

animals = {'dogs': [20, 10, 15, 8, 32, 15], 
 'cats': [3,4,2,8,2,4], 
 'rabbits': [2, 3, 3], 
 'fish': [0.3, 0.5, 0.8, 0.3, 1]}
 
print(animals['dogs'])
print(animals['dogs'][3])
print(animals[3]) # Error due to not defined
print(animals['fish'])

# Index fund of stocks and their returnrate and YTD returnrate

VINIX = {'C': [0.74, -6.51],  'MA': [0.78, 34.77],  'BA': [0.79, 17.01],  'PG': [0.85, -8.81],  'CSCO': [0.88, 18.56],  'VZ': [0.9, 2.16],  'PFE': [0.92, 13.96],  'HD': [0.97, 3.2],  
         'INTC': [1.0, 2.61],  'T': [1.01, -15.19],  'V': [1.02, 24.0],  'UNH': [1.02, 19.32],  'WFC': [1.05, -3.59],  'CVX': [1.05, -5.77],  'BAC': [1.15, 4.27],  'JNJ': [1.41, -5.58],  
         'GOOGL': [1.46, 17.84],  'GOOG': [1.47, 17.03],  'BRK.B': [1.5, 4.54],  'XOM': [1.52, -6.87],  'JPM': [1.53, 7.66],  'FB': [2.02, 0.91], 'AMZN': [2.96, 62.75], 'MSFT': [3.28, 26.61], 'AAPL': [3.94, 26.01]}


# invalid dictionary - this should break
room_numbers = {
    ['Freddie', 'Jen']: 403,
    ['Ned', 'Keith']: 391,
    ['Kristin', 'Jazzmyne']: 411,
    ['Eugene', 'Zach']: 395
} # Error is that keys are lists and that cannot be, as a list is mutable

#Fix
room_numbers = {
    'Freddie': 403, 'Jen': 403,
    'Ned': 391, 'Keith': 391,
    'Kristin': 411, 'Jazzmyne': 411,
    'Eugene': 395, 'Zach': 395
}

# Compound data structures
    # We can include containers in other containers to create compound data structures. For example, this dictionary maps keys to values that are also dictionaries!

elements = {"hydrogen": {"number": 1,
                         "weight": 1.00794,
                         "symbol": "H"},
              "helium": {"number": 2,
                         "weight": 4.002602,
                         "symbol": "He"}}


# We can access elements in this nested dictionary like this.
helium = elements["helium"]  # get the helium dictionary
hydrogen_weight = elements["hydrogen"]["weight"]  # get hydrogen's weight

# You can also add a new key to the element dictionary.
oxygen = {"number":8,"weight":15.999,"symbol":"O"}  # create a new oxygen dictionary 
elements["oxygen"] = oxygen  # assign 'oxygen' as a key to the elements dictionary
print('elements = ', elements)

# todo: Add an 'is_noble_gas' entry to the hydrogen and helium dictionaries
# hint: helium is a noble gas, hydrogen isn't

# add noble gas status
elements['hydrogen']['is_noble_gas']= False
elements['helium']['is_noble_gas']= True

# check noble gas status
print(elements['hydrogen']['is_noble_gas'])
print(elements['helium']['is_noble_gas'])

# check dictionary values
print(elements['hydrogen'])
print(elements['hydrogen'])


## Count unique words in string
verse = "if you can keep your head when all about you are losing theirs and blaming it on you   if you can trust yourself when all men doubt you     but make allowance for their doubting too   if you can wait and not be tired by waiting      or being lied about  don’t deal in lies   or being hated  don’t give way to hating      and yet don’t look too good  nor talk too wise"
print(verse, "\n")

## split verse into list of words
verse_list = verse.split()
print(verse_list, '\n')

## convert list to set to get unique words
verse_set = set(verse_list)
print(verse_set, '\n')

## print the number of unique words
num_unique = len(verse_set)
print(num_unique)


## Verse dictionary
verse_dict =  {'if': 3, 'you': 6, 'can': 3, 'keep': 1, 'your': 1, 'head': 1, 'when': 2, 'all': 2, 'about': 2, 'are': 1, 'losing': 1, 'theirs': 1, 'and': 3, 'blaming': 1, 'it': 1, 'on': 1, 'trust': 1, 'yourself': 1, 'men': 1, 'doubt': 1, 'but': 1, 'make': 1, 'allowance': 1, 'for': 1, 'their': 1, 'doubting': 1, 'too': 3, 'wait': 1, 'not': 1, 'be': 1, 'tired': 1, 'by': 1, 'waiting': 1, 'or': 2, 'being': 2, 'lied': 1, 'don\'t': 3, 'deal': 1, 'in': 1, 'lies': 1, 'hated': 1, 'give': 1, 'way': 1, 'to': 1, 'hating': 1, 'yet': 1, 'look': 1, 'good': 1, 'nor': 1, 'talk': 1, 'wise': 1}
print(verse_dict, '\n')

# find number of unique keys in the dictionary
num_keys = len(verse_dict)
print(num_keys)

# find whether 'breathe' is a key in the dictionary
contains_breathe = verse_dict.get('breathe')
print(contains_breathe)

# Alternative
contains_breathe2 = 'breathe' in verse_dict
print(contains_breathe2)

# create and sort a list of the dictionary's keys
sorted_keys = sorted(verse_dict.keys())

# get the first element in the sorted list of keys
print(sorted_keys[0])

# find the element with the highest value in the list of keys
print(sorted_keys[-1]) 

## Control flow
# An if statement is a conditional statement that runs or skips code based on whether a condition is true or false. Here's a simple example.
phone_balance = 19
bank_balance = 250
    
if phone_balance < 5:
    phone_balance += 10
    bank_balance -= 10
    
# Use comparison operators for conditional statements
# In addition to the if clause, there are two other optional clauses often used with an if statement. For example:
season = 'summer'
if season == 'spring':
    print('plant the garden!')
elif season == 'summer':
    print('water the garden!')
elif season == 'fall':
    print('harvest the garden!')
elif season == 'winter':
    print('stay indoors!')
else:
    print('unrecognized season')
    
# Identation is important in python, because it encloses blocks of code. Like what is included in an if statement

#First Example - try changing the value of phone_balance
phone_balance = 10
bank_balance = 50

if phone_balance < 10:
    phone_balance += 10
    bank_balance -= 10

print(phone_balance)
print(bank_balance)

#Second Example - try changing the value of number

number = 145
if number % 2 == 0:
    print("Number " + str(number) + " is even.")
else:
    print("Number " + str(number) + " is odd.")

#Third Example - try to change the value of age
age = 35

# Here are the age limits for bus fares
free_up_to_age = 4
child_up_to_age = 18
senior_from_age = 65

# These lines determine the bus fare prices
concession_ticket = 1.25
adult_ticket = 2.50

# Here is the logic for bus fare prices
if age <= free_up_to_age:
    ticket_price = 0
elif age <= child_up_to_age:
    ticket_price = concession_ticket
elif age >= senior_from_age:
    ticket_price = concession_ticket
else:
    ticket_price = adult_ticket

message = "Somebody who is {} years old will pay ${} to ride the bus.".format(age, ticket_price)
print(message)

# Write an if statement that lets a competitor know which of these prizes they won based on the number of points they scored, which is stored in the integer variable points.
points = 174  # use this input to make your submission

prize_name = ("wooden rabbit", "wafer-thin mint", "penguin")
# write your if statement here
if points <= 50:
    result = "Congratulations! You won a {}!".format(prize_name[0])
elif points <= 150:
    result = "Oh dear, no prize this time."
elif points <= 180:
    result = "Congratulations! You won a {}!".format(prize_name[1])
else:
    result = "Congratulations! You won a {}!".format(prize_name[2])
    

print(result)

# '''
# You decide you want to play a game where you are hiding 
# a number from someone.  Store this number in a variable 
# called 'answer'.  Another user provides a number called
# 'guess'.  By comparing guess to answer, you inform the user
# if their guess is too high or too low.

# Fill in the conditionals below to inform the user about how
# their guess compares to the answer.
# '''
answer = 42
guess = 69

if guess < answer:
    result = "Oops!  Your guess was too low."
elif guess > answer:
    result = "Oops!  Your guess was too high."
elif guess == answer:
    result = "Nice!  Your guess matched the answer!"

print(result)

# '''
# Depending on where an individual is from we need to tax them 
# appropriately.  The states of CA, MN, and 
# NY have taxes of 7.5%, 9.5%, and 8.9% respectively.
# Use this information to take the amount of a purchase and 
# the corresponding state to assure that they are taxed by the right
# amount.
# '''
state = "CA"
purchase_amount = 69420

if state == "CA":
    tax_amount = .075
    total_cost = purchase_amount*(1+tax_amount)
    result = "Since you're from {}, your total cost is {}.".format(state, total_cost)

elif state == "MN":
    tax_amount = .095
    total_cost = purchase_amount*(1+tax_amount)
    result = "Since you're from {}, your total cost is {}.".format(state, total_cost)

elif state == "NY":
    tax_amount = .089
    total_cost = purchase_amount*(1+tax_amount)
    result = "Since you're from {}, your total cost is {}.".format(state, total_cost)

print(result)

# Boolean expressions for conditions
height = 185
weight = 82

is_raining = True
is_sunny = False

unsubscribed = True
location = "USA"

if 18.5 <= weight / height**2 < 25:
    print("BMI is considered 'normal'")

if is_raining and is_sunny:
    print("Is there a rainbow?")

if (not unsubscribed) and (location == "USA" or location == "CAN"):
    print("send email")
    
# Sometimes and, or and not is necessary depending on complexity. Even sometimes combined

# Bad examples of boolean expressions for conditionals

if True:
    print("This indented code will always get run.") # True or False is a bad example of a boolean for conditional
    
if is_cold or not is_cold:
    print("This indented code will always get run.") # Bad example
    
if weather == "snow" or "rain":
    print("Wear boots!") # Only one is a boolean operator
    
if is_cold == True:
    print("The weather is cold!") # Boolean unecessary as a boolean variable is a boolean expression
    
# Using a non-boolean object as a condition, makes python check the truth value
errors = 3
if errors:
    print("You have {} errors to fix!".format(errors))
else:
    print("No errors to fix!") # This runs, because errors is a non-zero number
    
# assigning value to a None variable
points = 174

points = 174  # use this input when submitting your answer

## set prize to default value of None
prize = None

## use the value of points to assign prize to the correct prize name
if points <= 50:
    prize = "wooden rabbit"
elif 151 <= points <= 180:
    prize = "wafer-thin mint"
elif points >= 181:
    prize = "penguin"

## use the truth value of prize to assign result to the correct message
if prize:
    result = "Congratulations! You won a {}!".format(prize)
else:
    result = "Oh dear, no prize this time."

print(result)

## Loops
# For loop
#Example 1
cities = ['new york city', 'mountain view', 'chicago', 'los angeles']
for city in cities:
    print(city)
print("Done!")

#Example 2
for i in range(3):
    print("Hello!")
    
# Creating and modifying lists
## Creating a new list
cities = ['new york city', 'mountain view', 'chicago', 'los angeles']
capitalized_cities = []

for city in cities:
    capitalized_cities.append(city.title())
    
#Modifying a list
cities = ['new york city', 'mountain view', 'chicago', 'los angeles']

for index in range(len(cities)):
    cities[index] = cities[index].title()
    
sentence = ["the", "quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog"]

# Write a for loop to print out each word in the sentence list, one word per line
for word in sentence:
    print(word)
    
# Write a for loop using range() to print out multiples of 5 up to 30 inclusive
for i in range(5,35,5):
    print(i)
    
# Write a for loop that iterates over the names list to create a usernames list. Make everything lowercase and replace spaces with underscores.
names = ["Joey Tribbiani", "Monica Geller", "Chandler Bing", "Phoebe Buffay"]
usernames = []

# write your for loop here
for name in names:
    usernames.append(name.lower().replace(" ", "_"))

print(usernames)

# Write a for loop that uses range() to iterate over the positions in usernames to modify the list. Change each name to be lowercase and replace spaces with underscores.
usernames = ["Joey Tribbiani", "Monica Geller", "Chandler Bing", "Phoebe Buffay"]

# write your for loop here
for name in range(len(usernames)):
    usernames[name] = usernames[name].lower().replace(" ", "_")

print(usernames)

# Write a for loop that iterates over a list of strings, tokens, and counts how many of them are XML tags.
tokens = ['<greeting>', 'Hello World!', '</greeting>']
count = 0

# write your for loop here
for token in tokens:
    if token[0] == "<" and token[-1] == ">": # Uses string indexing
        count += 1
print(count) 

# Write some code, including a for loop, that iterates over a list of strings and creates a single string, html_str, which is an HTML list.
items = ['first string', 'second string']
html_str = "<ul>\n"  # "\ n" is the character that marks the end of the line, it does
                     # the characters that are after it in html_str are on the next line

# write your code here
items = ['first string', 'second string']
html_str = "<ul>\n"          # The "\n" here is the end-of-line char, causing
                             # chars after this in html_str to be on next line

for item in items:
    html_str += "<li>{}</li>\n".format(item)
html_str += "</ul>"

print(html_str)

# Building dictionaries
# Method 1
book_title =  ['great', 'expectations','the', 'adventures', 'of', 'sherlock','holmes','the','great','gasby','hamlet','adventures','of','huckleberry','fin']

# Create an empty dictionary
word_counter = {}

# Iterate through each element in the list. If an element is already included in the dictionary, add 1 to its value. If not, add the element to the dictionary and set its value to 1.
for word in book_title:
        if word not in word_counter:
            word_counter[word] = 1
        else:
            word_counter[word] += 1
            
#####  What's happening here?
    #- The `for` loop iterates through each element in the list. For the first iteration, `word` takes the value 'great'.
    #- Next, the if statement checks if `word` is in the `word_counter` dictionary.
    #- Since it doesn't yet, the statement  `word_counter[word] = 1` adds *great* as a key to the dictionary with a value of 1.
    #- Then, it leaves the if else statement and moves on to the next iteration of the for loop. `word` now takes the value *expectations* and repeats the process.
    #- When the if condition is not met, it is because that`word` already exists in the `word_counter` dictionary, and the statement `word_counter[word] = word_counter[word] + 1` increases the count of that word by 1.
    #- Once the `for` loop finishes iterating through the list, the `for` loop is complete. 
    
# Method 2
book_title =  ['great', 'expectations','the', 'adventures', 'of', 'sherlock','holmes','the','great','gasby','hamlet','adventures','of','huckleberry','fin']```

# Create an empty dictionary
word_counter = {}

# Iterate through each element, get() its value in the dictionary, and add 1.
for word in book_title:
    word_counter[word] = word_counter.get(word, 0) + 1
    
#####  What's happening here?
#- The `for` loop iterates through the list as we saw earlier. The `for` loop feeds 'great' to the next statement in the body of the `for` loop.
#-   In this line: ` word_counter[word] = word_counter.get(word,0) + 1`, since the key *'great'* doesn't yet exist in the dictionary, `get()` will return the value 0 and `word_counter[word]` will be set to 1.
#- Once it encounters a word that already exists in `word_counter` (e.g. the second appearance of *'the'*),  the  value for that key is incremented by 1. On the second appearance of 'the', the key's value would add 1 again, resulting in 2.
#- Once the `for` loop finishes iterating through the list, the `for` loop is complete.

#  iterate through both the keys and values in the dictionary
cast = {
           "Jerry Seinfeld": "Jerry Seinfeld",
           "Julia Louis-Dreyfus": "Elaine Benes",
           "Jason Alexander": "George Costanza",
           "Michael Richards": "Cosmo Kramer"
       }

# Iterating through it in the usual way with a for loop would give you just the keys, as shown below:
for key in cast:
    print(key)
    
# If you wish to iterate through both keys and values, you can use the built-in method items like this:
for key, value in cast.items():
    print("Actor: {}    Role: {}".format(key, value))
    
# You would like to count the number of fruits in your basket. 
# In order to do this, you have the following dictionary and list of
# fruits.  Use the dictionary and list to count the total number
# of fruits, but you do not want to count the other items in your basket.

result = 0
basket_items = {'apples': 4, 'oranges': 19, 'kites': 3, 'sandwiches': 8}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

#Iterate through the dictionary

#if the key is in the list of fruits, add the value (number of fruits) to result
for object, count in basket_items.items():
   if object in fruits:
       result += count

print("There are {} fruits in the basket.".format(result))

# Making sure solution is robust
#Example 1

result = 0
basket_items = {'pears': 5, 'grapes': 19, 'kites': 3, 'sandwiches': 8, 'bananas': 4}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

# Your previous solution here
for object, count in basket_items.items():
   if object in fruits:
       result += count

print("There are {} fruits in the basket.".format(result))

#Example 2

result = 0
basket_items = {'peaches': 5, 'lettuce': 2, 'kites': 3, 'sandwiches': 8, 'pears': 4}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

# Your previous solution here
for object, count in basket_items.items():
   if object in fruits:
       result += count

print("There are {} fruits in the basket.".format(result))

#Example 3

result = 0
basket_items = {'lettuce': 2, 'kites': 3, 'sandwiches': 8, 'pears': 4, 'bears': 10}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

# Your previous solution here
for object, count in basket_items.items():
   if object in fruits:
       result += count

print("There are {} fruits in the basket.".format(result))

# You would like to count the number of fruits in your basket. 
# In order to do this, you have the following dictionary and list of
# fruits.  Use the dictionary and list to count the total number
# of fruits and not_fruits.

fruit_count, not_fruit_count = 0, 0
basket_items = {'apples': 4, 'oranges': 19, 'kites': 3, 'sandwiches': 8}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

#Iterate through the dictionary

#if the key is in the list of fruits, add to fruit_count.
#if the key is not in the list, then add to the not_fruit_count
for object, count in basket_items.items():
    if object in fruits:
       fruit_count += count
    else:
        not_fruit_count += count

print("The number of fruits is {}.  There are {} objects that are not fruits.".format(fruit_count, not_fruit_count))