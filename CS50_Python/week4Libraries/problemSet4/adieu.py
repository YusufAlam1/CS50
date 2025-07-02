import inflect
p = inflect.engine()

names = []

while True:
    try:

        name = input("Name: ")
        names.append(name)

    except KeyboardInterrupt:
        print()
        break

print("Adieu, adieu, to",p.join(names))
