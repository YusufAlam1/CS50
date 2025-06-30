class Student:
    def __init__(self, name, house):
        self.name = name
        self.house = house

    def __str__(self):
        return f"{self.name} from {self.house}"

    def get(cls):
        name = input("Name: ")
        house = input("House: ")
        return cls(name, house)
    
    # @property
    # def name(self):
    #     return self.name
        
    # @name.setter
    # def name(self, name):
    #     if not name:
    #         raise ValueError("Missine name")
    #     self._name = name
    
    # # getter method
    # @property
    # def house(self):
    #     return self._house
    
    # # setter method
    # @house.setter
    # def house(self, house):
    #     if house not in ["Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin"]:
    #         raise ValueError("Invalid house")
    #     self._house = house

def main():
    student = get_student() 
    print(student)


if __name__ == "__main__":
    main()