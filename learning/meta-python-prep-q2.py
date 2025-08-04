# Question: Write a Python function called count_vowels that takes a string as input and returns the number of vowels (a, e, i, o, u, case-insensitive) in it. If the string is empty, return 0.

def count_vowels(my_string):
    vowels = ['a', 'e', 'i', 'o', 'u']
    num_of_vowels = 0

    for letter in my_string:
        if letter.lower() in vowels:
            num_of_vowels += 1

    return num_of_vowels

print(count_vowels('Hello, World Aya!'))