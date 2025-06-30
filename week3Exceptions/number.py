def main():
    x = get_int("What's x? ")
    print(f"x is {x}")


def get_int(x):
    while True:
        try:
            x = int(input(x))
            return x
        except ValueError:
            # print("x is not an integer")
            pass

main()