#lambda functions
def square(x):
    return x**2

square_lambda = lambda x: x**2

print(square(5))
print(square_lambda(5))

numbers = [1, 2, 3, 4, 5]

# Using lambda with map
squared_numbers = list(map(lambda x: x**2, numbers))
print(squared_numbers)  # Output: [1, 4, 9, 16, 25]

# Using lambda with filter
even_numbers = list(filter(lambda x: x % 2 == 0, numbers))
print(even_numbers)  # Output: [2, 4]