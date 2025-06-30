groceries = {}

while True:
    try:

        item = input()

        if item in groceries:
            groceries[item] += 1  # Increment the count if the item already exists
        else:
            groceries[item] = 1  # Initialize the count if the item is new


    except EOFError:
        print()
        break

for item in sorted(groceries.keys()):
    print(groceries[item], item.upper())