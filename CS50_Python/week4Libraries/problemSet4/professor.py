import random


def main():
    
    level = get_level()
    correct = 0

    for i in range(10):
        incorrect = 0   
        
        num1 = generate_integer(level)
        num2 = generate_integer(level)
        answer = num1 + num2
        userAnswer = 0
        question = f"{num1} + {num2} = "

        while userAnswer != answer:
            while True:
                try:
                    userAnswer = int(input(question))
                    if incorrect > 3:
                        break
                    break
                except ValueError:
                    incorrect+=1
                    pass
            if userAnswer == answer:
                correct+=1
            else:
                incorrect+=1
                print("EEE")
                if incorrect >= 3:
                    break
            

    print(f"Score: {correct}")

def get_level():
    while True:
        try:
            level = int(input("level: "))
            if level > 3 or level < 1:
                pass
            else:
                return level
        except ValueError:
            pass


def generate_integer(level):

    match level:
        case 1:
            n = random.randint(1, 9)
        case 2:
            n = random.randint(10, 99)
        case 3:
            n = random.randint(100, 999)
    return n


if __name__ == "__main__":
    main()