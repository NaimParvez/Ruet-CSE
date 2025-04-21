# Demonstration of Multiple Inheritance in Python

class Parent1:
    def __init__(self):
        self.str1 = "Parent1"
        print("Parent1 initialized")

    def show_str1(self):
        return self.str1


class Parent2:
    def __init__(self):
        self.str2 = "Parent2"
        print("Parent2 initialized")

    def show_str2(self):
        return self.str2


class Child(Parent1, Parent2):
    def __init__(self):
        # Initialize both parents
        Parent1.__init__(self)
        Parent2.__init__(self)
        print("Child initialized")

    def show_all(self):
        return f"{self.show_str1()} and {self.show_str2()}"


# Example usage
if __name__ == "__main__":
    child = Child()
    print(child.show_all())