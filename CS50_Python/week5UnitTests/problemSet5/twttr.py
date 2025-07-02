def main():
    words = input("Input: ")
    print("Output: ", end="")
    print(shorten(words))


def shorten(words):
    result = ""
    for c in words:
        if c.lower() not in "aeiou":
            result += c
    return result


if __name__ == "__main__":
    main()