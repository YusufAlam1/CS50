import random

    
def main():
    
    s = "Level: "
    level = error(s)
    answer = random.randint(1, level)
    guess = 0
    s = "Guess: "

    while answer != guess:
        guess = error(s)
        if guess < answer:
            print("Too small!")
        elif guess > answer:
            print("Too large!")
        else:
            print("Just right!")


def error(s):
    while True:
        try:
            n = int(input(s))
            if n < 0:
                pass
            else:
                return n
        except ValueError:
            pass


if __name__ == "__main__":
    main()