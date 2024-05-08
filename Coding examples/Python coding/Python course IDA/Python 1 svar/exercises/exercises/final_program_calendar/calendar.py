# this program was made live in the first python course
calendar = {}

calendar['06/02/2022'] = 'Python1 with IDA'
calendar['20/04/2022'] = 'Make homework for machine learning assigment'
calendar['03/05/2022'] = 'Python advanced with IDA'
calendar['07/07/2022'] = 'Going to bornholm with fam'

def add_to_calendar():
    print('Please enter the date which you want to schedule: ')
    date = input()
    print('Please enter what you are going to do this day: ')
    value = input()
    calendar[date] = value  

def see_schedule(): 
    print('Please enter the date which you want to see: ')
    date = input()
    print('On the day: ' + date + ' you have plans to: ')
    print(calendar.get(date))

def main_loop(): 
    command = ''
    while (command != 'exit'): 
        print('Please enter add to add a event, or see to see your schedule, or exit to exit the calendar')
        command = input()
        if (command == 'add'): 
            add_to_calendar()
        elif (command == 'see'):
            see_schedule()
        else: 
            if (command != 'exit'): 
                print('Please only enter a valid command')

main_loop()
