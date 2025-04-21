# Single Level Inheritance Example

# Base class
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        return f"{self.name} makes a sound."

# Derived class
class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name)
        self.breed = breed

    def speak(self):
        return f"{self.name} barks. It is a {self.breed}."

# Example usage
if __name__ == "__main__":
    dog = Dog("Buddy", "Golden Retriever")
    print(dog.speak())