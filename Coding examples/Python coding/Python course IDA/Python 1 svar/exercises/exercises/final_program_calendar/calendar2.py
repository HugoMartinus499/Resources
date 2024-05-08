calendar = {}

calendar['06/02/2022'] = 'Python begynder kursus for IDA'
calendar['07/02/2022'] = 'Anders skal jobbe'

def add_to_calendar():
    print("Please enter a date: ")
    date = input()
    print("Please enter a description for the date: ")
    description = input()
    calendar[date] = description
    print("On the date: " + date + " you have plans to: " + description)

def get_from_calendar():
    print("Please enter date: ")
    date = input()
    description = calendar.get(date)
    print("On the date: " + date + " you have plans to: " + description)

def get_all():
    for i in calendar.keys(): 
        print("On this date: " + i + " you are going to: " + calendar.get(i))

def main_loop():
    command = ''
    while (command != 'exit'):
        print('Write add to add to the calendar, get to get from the calender, getall to get all from the calendar or exit to exit the program. ')
        command = input()
        if (command == 'add'):
            add_to_calendar()
        elif (command == 'get'):
            get_from_calendar()
        elif (command == 'getall'):
            get_all()
        else: 
            print('Please only write valid commands. ')

main_loop()