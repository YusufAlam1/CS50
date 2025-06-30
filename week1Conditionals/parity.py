def main():
    x = int(input("What's x? "))
    if is_Even(x):
        print("Even")
    else:
        print("Odd")


def is_Even(n):
    return n % 2 == 0

main()