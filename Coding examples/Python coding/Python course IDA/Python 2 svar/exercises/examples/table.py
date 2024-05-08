class Table: 
    amount_of_legs = 0
    material = ""
    height = 0

    def __init__(self, a_o_l, m, h): 
        self.amount_of_legs = a_o_l
        self.material = m
        self.height = h
    
    def print_table(self): 
        print(str(self.amount_of_legs) + " " + self.material + " " + str(self.height))
    