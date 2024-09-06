class calculator:
    def __init__(self, first, second):
        self.first = first
        self.second = second
    def addition(self):
        return self.first+self.second
    def multiplication(self):
        return self.first*self.second
    def subtraction(self):
        return self.first-self.second
    def division(self):
        return self.first/self.second

cal = calculator(5, 2)
print(cal.addition())