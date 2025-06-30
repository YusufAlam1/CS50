import sys
import csv

# Check for the correct number of command-line arguments
if len(sys.argv) < 3:
    sys.exit("Too few command-line arguments")
elif len(sys.argv) > 3:
    sys.exit("Too many command-line arguments")

# Ensure the input file is a CSV file
if not sys.argv[1].endswith(".csv"):
    sys.exit("Could not read " + sys.argv[1])

students = []

# Read the input CSV file
try:
    with open(sys.argv[1]) as file:
        reader = csv.DictReader(file)
        for row in reader:
            students.append({"name": row["name"], "house": row["house"]})

except FileNotFoundError:
    sys.exit("Could not read " + sys.argv[1])

# Write to the output CSV file
with open(sys.argv[2], "w", newline='') as file:
    writer = csv.DictWriter(file, fieldnames=["first", "last", "house"])
    writer.writeheader()

    for student in students:
        last, first = student["name"].split(",")
        writer.writerow({"first": first.strip(), "last": last.strip(), "house": student["house"]})