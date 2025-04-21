class Phone:
    
    def __init__(self,price,brand,camera):
        print("inside Phone cons")
        
        self.__price =price
        self.brand = brand
        self.camera =camera
        
    def get_price(self):
        return self.__price
        
class SmartPhone(Phone):
    
    def __init__(self, price, brand, camera,os,ram):
        super().__init__(price, brand, camera)  #this should be the 1st instruction otherwise it won't work
        self.os =os
        self.ram=ram
        print("inside smartphone cons")
        
    def show_info(self):
        print(self.brand)
        print(self.os)
        
s=SmartPhone(20000,"samsung",12,"Android",16)

s.show_info()
print(s.get_price())