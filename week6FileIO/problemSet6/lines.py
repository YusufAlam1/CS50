import sys

if len(sys.argv) < 2:
    sys.exit("Too few command-line arguments")
elif len(sys.argv) > 2:
    sys.exit("Too Many command-line arguments")

if sys.argv[1].endswith(".py") == False:
    sys.exit("Not a python file")

try:
    with open(sys.argv[1]) as file:
        lines = 0
        for line in file:
            print(line.strip())
            if line.strip() == "" or line.strip().startswith("#"):
                pass
            else:
                lines+=1
except FileNotFoundError:
    sys.exit("File does not exist")

print(lines)
