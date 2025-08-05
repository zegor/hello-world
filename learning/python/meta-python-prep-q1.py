# Question: Write a Python function called sum_even_numbers that takes a list of integers as input and returns the sum of all even numbers in the list. If the list is empty or has no even numbers, return 0.

def sum_even_numbers(num_list):
    num_sum = 0
    
    for num in num_list:
        if num % 2 == 0:
            num_sum += num
    
    return num_sum

print(sum_even_numbers([2, 4, 9, 6]))