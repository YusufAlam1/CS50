# students = ["Hermione", "Harry", "Ron"]

# for student in students:
#     print(student)

# for i in range(len(students)):
#     print(i + 1, students[i])

# students = {
#     "Hermione" : "Gryffindor",
#     "Harry" : "Gryffindor",
#     "Ron" : "Gryffindor",
#     "Draco" : "Slytherin",
# }

# for student in students:
#     print(student, students[student], sep=" ,")
    
students = [
    {"Name": "Hermione", "House": "Gryffindor", "Patronus": "Otter"},
    {"Name": "Harry", "House": "Gryffindor", "Patronus": "Stag"},
    {"Name": "Ron", "House": "Gryffindor", "Patronus": "Jack Russel Terrier"},
    {"Name": "Draco", "House": "Slytherin", "Patronus": None}
]

for student in students:
    print(student["Name"], student["House"], student["Patronus"], sep=", ")