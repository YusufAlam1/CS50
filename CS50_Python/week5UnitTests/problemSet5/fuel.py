def main():
    while True:
        try:
            fraction = input("Fraction: ")
            percentage = convert(fraction)
            break

        except (ValueError, ZeroDivisionError):
            pass

    
    print(gauge(percentage))

def convert(fraction):
    try:
        X, Y = fraction.split("/")
        X = int(X)
        Y = int(Y)

        if X > Y:
            1/0

        percentage = int(round((X/Y) * 100))
        return percentage
    except (ValueError, ZeroDivisionError):
        raise 


def gauge(percentage):
    if percentage <= 1:
        fuel = "E"
    elif percentage >= 99:
        fuel = "F"
    else:
        fuel = f"{percentage}%"
    return fuel


if __name__ == "__main__":
    main()