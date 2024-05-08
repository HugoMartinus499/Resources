from beer import Beer

beer1 = Beer("Tuborg Pilsner", 4.6, "Tuborg")
beer2 = Beer("Odense Classic", 4.6, "Albani")
beer3 = Beer("Odense Pilsner", 4.6, "Albani")
beer1.print_beer()
beer2.print_beer()
beer3.print_beer()

beer3.change_percentage(7.5)
beer3.print_beer()