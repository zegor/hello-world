my_list = [['bob', 25], ['alice', 30], ['charlie', 35]]
my_names = [name for name, age in my_list]
my_ages = [age for name, age in my_list]
students = [student[0] for student in my_list]
print(my_names)
print(my_ages)
print(students)