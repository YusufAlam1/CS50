import re
import sys


def main():
    print(convert(input("Hours: ").strip()))


def convert(s):
    if match := re.search(r"^(1[0-2]|[1-9]):?([0-5][0-9])? (AM|PM) to (1[0-2]|[1-9]):?([0-5][0-9])? (AM|PM)$", s, re.IGNORECASE):
        
        h1 = int(match.group(1))
        h2 = int(match.group(4))
        
        if match.group(2):
            m1 = int(match.group(2)) 
        else:
            m1 = 0
        if match.group(5):
            m2 = int(match.group(5))  
        else:
            m2 = 0
        
        ap1, ap2 = match.group(3), match.group(6)
        
        if ap1 == "AM" and h1 == 12:
            h1 = 0
        elif ap1 == "PM" and h1 != 12:
            h1 += 12

        if ap2 == "AM" and h2 == 12:
            h2 = 0
        elif ap2 == "PM" and h2 != 12:
            h2 += 12
            
        return f"{h1:02}:{m1:02} to {h2:02}:{m2:02}"
    else:
        raise ValueError


if __name__ == "__main__":
    main()