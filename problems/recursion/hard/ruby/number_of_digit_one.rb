# Number of Digit One
# https://leetcode.com/problems/number-of-digit-one/
# Given an integer n, count the total number of digit 1 appearing in all non-negative integers less than or equal to n.

# VERSION 1
# Runtime: N/A
# Memory: N/A
# Note: Using recursion. Time Limit Exceeded on LC. Stack Level Too Deep locally.

# -------------------------------------

# def count_digit_one(n)
#   return 0 if n <= 0
  
#   ones = 0
#   n.to_s.each_char do |digit|
#     ones += 1 if digit == "1"
#   end
  
#   ones += count_digit_one(n - 1)
# end

# ===================================================================== #

# VERSION 2
# Runtime: N/A
# Memory: N/A
# Note: From ChatGPT. Without recursion. Works but Time Limit Exceeded on LC.

# -------------------------------------

# def count_digit_one(n)
#   ones = 0

#   # Loop over all numbers from 1 to n
#   (1..n).each do |num|
#     # Count the number of 1's in the string representation of the number
#     ones += num.to_s.count("1")
#   end
  
#   # Return the total count of 1's
#   ones  
# end

# ===================================================================== #

# VERSION 3
# Runtime: Not run on LC
# Memory: Not run on LC
# Note: From ChatGPT. Without recursion, without call to `to_s` and `count`.

# -------------------------------------

# def count_digit_one(n)
#   # Initialize a variable to keep track of the number of ones
#   ones = 0
  
#   # Loop through all the numbers from 1 to n
#   (1..n).each do |num|
#     # For each number, check its digits by dividing by 10 until all digits have been checked
#     while num > 0
#       # If the last digit of the number is 1, add 1 to the count of ones
#       ones += 1 if num % 10 == 1
#       # Divide the number by 10 to remove the last digit
#       num /= 10
#     end
#   end
  
#   # Return the total number of ones found in all numbers from 1 to n
#   ones
# end

# ===================================================================== #

# VERSION 4
# Runtime: Not run on LC
# Memory: Not run on LC
# Note: From ChatGPT. No DP, No Recursion, No Memoization. Just crazy Math.

# -------------------------------------

def count_digit_one(n)
  return 0 if n <= 0

  # Initialize a variable to count the number of digit 1s
  ones = 0
  # Initialize the divisor to 1
  divisor = 1
  
  # Loop through each place value in the number, starting from the ones place
  while divisor <= n
    # Calculate the quotient and remainder of dividing the number by the divisor
    quotient = n / divisor
    remainder = n % divisor

    # Count the number of digit 1s in the current place value
    ones += (quotient + 8) / 10 * divisor
    
    # If the current place value is 1, count the number of digit 1s in the remaining digits
    if quotient % 10 == 1
      ones += remainder + 1
    end

    # Increment the divisor to move to the next place value
    divisor *= 10
  end

  # Return the total number of digit 1s
  ones
end

# ===================================================================== #

p count_digit_one(0) #=> 0
p count_digit_one(1) #=> 1
p count_digit_one(11) #=> 4
p count_digit_one(13) #=> 6
p count_digit_one(212) #=> 145
p count_digit_one(3184191) #=> 2978524