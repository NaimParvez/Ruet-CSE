class Railway:
    
    def __init__(self):
       
       user_input = input("""Enter the name of the railway: 
                          1.Enter 1 to check live train status
                          2.Enter 2 to check PNR
                          3.Enter 3 to check train schedule
                          """)
       
       if user_input == '1':
          print("You have selected live train status")
       elif user_input == '2':
          print("You have selected PNR")
       else:
          self.train_schedule()
    
    def train_schedule(self):
        print("You have selected train schedule")
        # train_name = input("Enter the name of the train: ")
        train_number = input("Enter the number of the train: ")
        print(f"Train Number: {train_number}")
        self.fetch_data(train_number)

    def fetch_data(self, train_number):
        # Simulate fetching data from a database or API
        print(f"Fetching data for train number: {train_number}")
        # Here you would typically have code to fetch and display the train schedule
        # For example, using an API call or database query
        print("Train schedule data fetched successfully.")
    


#loading ..............