import random


class Atm:
    #class/static variable
    __counter=1
    
    def __init__(self):
        #instant variable
        self.card_num=''
        self.__balance = 0
        self.__pin = ''
        self.serial =Atm.__counter
        Atm.__counter+=1
          
            
    @staticmethod
    def get_counter():  #we don't need to pass any obj since we are not deal with obj
        return Atm.__counter
    @staticmethod
    def set_counter(new):
        if type(new)==int:
            Atm.__counter =new
        else:
            print("not Allowed")

        
        # self.menu()
        
    def menu(self):
        print('1. Create ATM card')
        print('2. Enter to deposit')
        print('3. Enter to withdraw')
        print('4. Show balance')
        print('5. Exit')

        choice = int(input('Enter your choice: '))
        
        if choice == 1:
            self.create_card()
        elif choice == 2:
            self.deposit()
        elif choice == 3:
            self.withdraw()
        elif choice == 4:
            self.show_balance()
        elif choice == 5:
            exit()
        else:
            print('Invalid choice')
            self.menu()
            
    def create_card(self):
        self.card_num = ''.join([str(random.randint(0, 9)) for _ in range(6)])
        self.__balance=int(input("enter the banalace:"))
        self.__pin=input("Enter your pin:")
        
        print("your account has been created")
        print(f'your account number is {self.card_num}')
        # self.menu()
        
    def deposit(self):
        temp =input("Enter your pin:")
        if temp==self.__pin:
            amount=int(input("enter amount:"))
            self.__balance+=amount
            print(f' amount {amount} taka has been deposited successfully')
        else:
            print("Invalid pin")
        # self.menu()
    
    def withdraw(self):
        temp =input("Enter your pin:")
        if temp==self.__pin:
            amount=int(input("enter amount:"))
            if amount > self.__balance:
                print("Insufficient balance")
            else:
               self.__balance-=amount
               print(f' amount {amount} taka has been withdraw successfully')
        else:
            print("Invalid pin")
        # self.menu()
    
    
    def show_balance(self):
        temp =input("Enter your pin:")
        if temp==self.__pin:
            print(self.__balance)
        else:
            print("Invalid pin")
        # self.menu()       


        
if __name__ == "__main__":
    atm = Atm() 