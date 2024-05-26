def create_cast_list(filename):
    cast_list = []
    #use with to open the file filename
    with open(filename,'r') as file:
    #use the for loop syntax to process each line
        for line in file:
            name = line.split(',')[0]
    #and add the actor name to cast_list
            cast_list.append(name)

    return cast_list

cast_list = create_cast_list('flying_circus_cast.txt')
for actor in cast_list:
    print(actor)