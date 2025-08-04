# Question: Write a Python function called reverse_words that takes a string as input and returns a new string with the words reversed in order (e.g., "hello world" becomes "world hello"), while preserving the original whitespace between words. If the input is empty or has no words, return the empty string. Trim any leading/trailing whitespace from the result.

def reverse_words(my_string):
    my_string = my_string.strip()
    my_split_string_list = my_string.split(' ')
    my_split_string_list_length = len(my_split_string_list)
    my_reversed_string_list = []

    for i, word in enumerate(my_split_string_list):
        my_reversed_string_list.append(my_split_string_list[my_split_string_list_length - 1 - i])

    my_reversed_string = ' '.join(my_reversed_string_list)

    return my_reversed_string

print(reverse_words('I am Sam'))

# Notes:
# - Use list.reverse() to reverse the list instead of manually iterating, or:
# - Use slicing to reverse the list: reversed_list = list[::-1] (where [start:end:step] is the slicing syntax).