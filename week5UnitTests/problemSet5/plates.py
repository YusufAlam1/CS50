def main():
    plate = input("Plate: ").upper()
    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")


def is_valid(s):
    
    # length requirements
    if len(s) > 6 or len(s) < 2:
        return False 
    
    # special charcter requirements
    elif any(char in s for char in " .,!?"):
        return False
    
    # 1st 2 character requiremetns
    elif not s[0:2].isalpha():
        return False
    
    # 0 first number requirments
    i = 0
    while i < len(s):
        if s[i].isdigit():
            if s[i] == '0':
                return False
            else:
                break
        i+=1

    # last character # requirements
    i = 0
    while i < len(s):
        if s[i].isalpha():
            i += 1
        else:
            while i < len(s):
                if s[i].isdigit():
                    i += 1
                else:
                    return False
    return True


if __name__ == "__main__":
    main()