while True:
    try:
        frac = input("Fraction: ")
        X, Y = frac.split("/")
        X = int(X)
        Y = int(Y)
        percent = int(round((X/Y) * 100))

        if X > Y:
            print(1/0)

        break

    except (ValueError, ZeroDivisionError):
        pass

if percent <= 1:
    print("E")
elif percent >= 99:
    print("F")
else:
    print(f"{percent}%")
