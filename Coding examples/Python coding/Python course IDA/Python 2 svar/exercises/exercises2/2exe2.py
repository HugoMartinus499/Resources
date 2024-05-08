def write_to_file(list_input): 
    my_file = open("favourite_beverage.txt", "w+")
    for i in list_input:
        my_file.write(i + "\n")
    my_file.close()

beer_list = ["odense", "tuborg", "albani"]
write_to_file(beer_list)
