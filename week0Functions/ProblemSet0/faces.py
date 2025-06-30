def convert(words):
    convertedWords = words.replace(":)", "🙂").replace(":(", "🙁")
    return convertedWords


def main():
    words = input()
    convertedWords = convert(words)
    print(convertedWords)


main()