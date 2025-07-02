def main():
    greeting = input("Greeting: ")
    money = value(greeting)
    print(f"${money}")


def value(greeting):
    greeting = greeting.lower().strip()

    if "hello" in greeting[0:5]:
        money = 0
    elif "h" in greeting[0]:
        money = 20
    else:
        money = 100
    return money

if __name__ == "__main__":
    main()
