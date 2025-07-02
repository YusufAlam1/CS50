amount = 50

while(amount > 0):
    print("Amount Due:", amount)
    coin = int(input("Insert Coin: "))
    if coin == 50 or coin == 25 or coin == 10 or coin == 5:
        amount = amount - coin


change = 0 - amount

print("Change Owed:", change)