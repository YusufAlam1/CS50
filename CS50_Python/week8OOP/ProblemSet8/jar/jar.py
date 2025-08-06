class Jar:
    def __init__(self, capacity=1):
        if not isinstance(capacity, int) or capacity < 0:
            raise ValueError("Capacity must be a non-negative integer.")
        self._capacity = capacity
        self.cookies = 0

    
    def __str__(self):
        return f"{"🍪" * self.cookies}"
    
    
    def deposit(self, n):
        if(self.cookies + n > self.capacity):
            raise ValueError("TOO MANY COOKIES!")
        self.cookies += n
        print(f"{n} cookie{'s' if n != 1 else ''} added to the jar 😋")


    def withdraw(self, n):
        if(self.cookies - n < 0):

            raise ValueError("YOU TOOK TOO MANY COOKIES!")
        self.cookies -= n
        print(f"You ate {n} cookie{'s' if n != 1 else ''} 😋")


    @property
    def capacity(self):
        return self._capacity

    @property
    def size(self):
        return self.cookies


def main():
    jar = Jar(10)
    jar.deposit(3)
    jar.withdraw(2)
    print(jar)
    print(jar.capacity)
    print(jar.size) 


if __name__ == "__main__":
    main()