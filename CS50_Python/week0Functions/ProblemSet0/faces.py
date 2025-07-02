def convert(words):
    convertedWords = words.replace(":)", "🙂").replace(":(", "🙁")
    return convertedWords


def main():
    words = input()
    convertedWords = convert(words)
    print(convertedWords)


main()


# def convert(message):
#     print("You are: ", message.replace(":)", "🙂").replace(":(","😟"))


# def main():
#     message = input("Are you happy or sad: ")
#     convert(message)
          
# if  __name__ == "__main__":
#     main()