def write_to_file(list_input): 
    my_file = open("user_fav_bev.txt", "w+")
    for i in list_input:
        my_file.write(i + "\n")
    my_file.close()

def get_user_input(): 
    beer_list = []
    for i in range(5): 
        print("Please enter your " + str(i+1) + "st favourite beer: ")
        beer = input()
        beer_list.append(beer)
    return beer_list

user_beer_list = get_user_input()
write_to_file(user_beer_list)