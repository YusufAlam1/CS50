import re

def main():
    code = input("Hexidecimal color code: ")
    
    pattern = r"^#[A-F0-9]{6}$"
    match = re.search(pattern, code, re.IGNORECASE)
    if match:
        print(f"Valid. Matched with {match.group()}")
    else:
        print("invalid")


main()