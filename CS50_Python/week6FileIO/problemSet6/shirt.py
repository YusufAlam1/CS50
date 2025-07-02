import sys
from PIL import Image, ImageOps

# Check the number of command-line arguments
if len(sys.argv) < 3:
    sys.exit("Too few command-line arguments")
elif len(sys.argv) > 3:
    sys.exit("Too many command-line arguments")

# Check if the file extensions are valid
if not (sys.argv[1].lower().endswith(('.jpg', '.jpeg', '.png')) and sys.argv[2].lower().endswith(('.jpg', '.jpeg', '.png'))):
    sys.exit("Not a png or jpg")
elif sys.argv[1][-4:].lower() != sys.argv[2][-4:].lower():
    sys.exit("Input and output have different extensions")

try:
    # Open the images
    file = Image.open(sys.argv[1])
    shirt = Image.open("shirt.png")
    size = shirt.size
    muppet = ImageOps.fit(file, size)

    muppet.paste(shirt, shirt)
    
    muppet.save(sys.argv[2])

except FileNotFoundError:
    sys.exit("Input does not exist")
