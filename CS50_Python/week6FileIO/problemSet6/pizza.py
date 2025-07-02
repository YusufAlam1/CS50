import sys
import csv
import tabulate

# Command-line arguments check
if len(sys.argv) < 2:
    sys.exit("Too few command-line arguments")
elif len(sys.argv) > 2:
    sys.exit("Too many command-line arguments")

# Check if the file is a CSV file
if not sys.argv[1].endswith(".csv"):
    sys.exit("Not a CSV file")  

try:
    # Read the CSV file using DictReader
    with open(sys.argv[1]) as file:
        reader = csv.DictReader(file)
        table = [row for row in reader]
        
        # Print the table using tabulate
        print(tabulate.tabulate(table, headers="keys", tablefmt="grid"))

except FileNotFoundError:
    sys.exit("File does not exist")