from pyfiglet import Figlet
figlet = Figlet()
import sys
import random


def main():
    
    if len(sys.argv) < 2:
        figlet.setFont(font = random.choice(figlet.getFonts())) 
        str = input("Input: ")
        print(figlet.renderText(str))
    elif "-f" != sys.argv[1] and "--font" != sys.argv[1] and sys.argv[1] not in figlet.getFonts():
        sys.exit("Invalid usage")
    else:
        str = input("Input: ")
        figlet.setFont(font = sys.argv[2])     
        print(figlet.renderText(str))

if __name__ == "__main__":
    main()