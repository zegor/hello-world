# Question: Write a Python function called longest_word that takes a string as input, splits it into words (assuming words are separated by spaces), and returns the longest word. If there are multiple words of the same maximum length, return the first one. If the string is empty or has no words, return an empty string. Ignore punctuation attached to words for length calculation (e.g., treat "world!" as "world" of length 5).

import string

def longest_word(my_string):
    the_longest_word = ''
    the_longest_word_without_punc = ''
    split_string = my_string.split(' ')

    for word in split_string:
        word_without_punc = ''.join([char for char in word if char not in string.punctuation])
        if len(word_without_punc) > len(the_longest_word_without_punc):
            the_longest_word_without_punc = word_without_punc
            the_longest_word = word

    return the_longest_word

print(longest_word('Hey mate, how are you going today?'))