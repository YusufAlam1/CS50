# Meow 3 times using loops
# print("meow")
# print("meow")
# print("meow")

# Using a while loop
# i = 0
# while i < 3:
#     print("meow")
#     i += 1
    

# using a for loop
# for _ in range(3):
#     print("meow")

# # error trapping
# while True:
#     n = int(input("What's  n? "))
#     if n > 0:
#         break
        
# for _ in range(n):
#     print("meow")

def main():
    number = get_number()
    meow(number)


def get_number():
    while True:
        n = int(input("What's n? "))
        if n > 0:
            break
    return n

def meow(n):
    for _ in range(n):
        print("meow")


main()