# Base class
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        return f"{self.name} makes a sound."

# Derived class 1
class Dog(Animal):
    def speak(self):
        return f"{self.name} barks."

# Derived class 2
class Cat(Animal):
    def speak(self):
        return f"{self.name} meows."

# Derived class 3
class Cow(Animal):
    def speak(self):
        return f"{self.name} moos."

# Example usage
if __name__ == "__main__":
    dog = Dog("Buddy")
    cat = Cat("Whiskers")
    cow = Cow("Daisy")

    print(dog.speak())
    print(cat.speak())
    print(cow.speak())