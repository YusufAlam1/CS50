import re
import sys


def main():
    ip = input("IPv4 Address: ")
    print(validate(ip))
    

def validate(ip):
    match = re.search(r"^((?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?))*$", ip)
    
    if match:    
        print(match.group())
        return True
    else:
        return False


if __name__ == "__main__":
    main()