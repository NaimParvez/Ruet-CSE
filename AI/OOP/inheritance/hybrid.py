# hybrid.py

class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        return f"{self.name} makes a sound."

class Bird(Animal):
    def __init__(self, name, can_fly=True):
        super().__init__(name)
        self.can_fly = can_fly

    def speak(self):
        return f"{self.name} chirps."

class Mammal(Animal):
    def __init__(self, name, is_warm_blooded=True):
        super().__init__(name)
        self.is_warm_blooded = is_warm_blooded

    def speak(self):
        return f"{self.name} growls."

class Bat(Mammal, Bird):
    def __init__(self, name):
        Mammal.__init__(self, name)
        Bird.__init__(self, name, can_fly=True)

    def speak(self):
        return f"{self.name} screeches."

# Example usage
if __name__ == "__main__":
    bat = Bat("Bruce")
    print(bat.speak())
    print(f"Can fly: {bat.can_fly}")
    print(f"Warm-blooded: {bat.is_warm_blooded}")