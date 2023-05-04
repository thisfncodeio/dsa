# BINARY SEARCH
# --------------
# Best Use Case: 1. When searching large sorted arrays for a specific element.
#                2. The problem involves finding a value that satisfies a certain condition.
#                3. The problem involves searching for a specific value or finding the optimal value for some criteria.
#                4. The problem has a large search area that can be divided in half with each iteration of the algorithm.
#                5. The problem must be solved in logarithmic time complexity.
#
# Worst Use Case: 1. When the array is unsorted or frequently modified. (The array must go unchanged during the search process. If a
#                    change is made, the array may need to be re-sorted or have the elements shifted, which could be time-consuming.)
#                 2. The array contains duplicate elements. (The ambiguity would make it difficult to know which of the indexes to return)
#                 3. When you need to find the min and max values in an array. (In order to find the min and max values, the array would first need to be sorted.
#                    Linear Search would probably be a better algorithm in this case, since you would not need to sort)
#                 4. When you need to find all occurrences of an element. (Linear Search or Hash Tables would be better algorithms)
#--------------------------
# Time Complexity: O(logn) => We reduce the search area by half on each pass
# Space Complexity: O(1) => No matter how big or small the array gets, we only every initial the same 
#                           variables (lower_bound, upper_bound, mid_idx, mid_value)
#                           Note: This is different from a recursive implementation of Binary Search which
#                           has a space complexity of O(logn)
# -----------------------------------------
# NeetCode Practice Problems: https://neetcode.io/practice (Show Grouped View > Binary Search)
# LeetCode Practice Problems: https://leetcode.com/tag/binary-search/

# ----------------------------------------------------------------------------------------------------------------------

# TASK: Searching for an element in an array
# Returns index of the target element or `nil`

def binary_search(array, target)
  # Setting the initial search area to be the entire array
  lower_bound = 0
  upper_bound = array.length - 1

  # We are doing `<=` because we want all array elements to get checked. If we imagine an array
  # with a single element, both the upper and lower bounds would be be 0 and if we did `0 < 0` this
  # would return false and the loop would never run, even if the element was indeed our target
  while lower_bound <= upper_bound
    # This could also be written as `(lower_bound + upper_bound) / 2` but on rare occasions
    # may run into a situation where you run into an integer overflow if the array indexes get
    # too large for an integer to hold accurately
    mid_idx = lower_bound + (upper_bound - lower_bound) / 2
    mid_value = array[mid_idx]

    if mid_value == target
      # Break the loop and exit the method, we found our target
      return mid_idx
    elsif mid_value > target
      # If target is on the left of `mid_idx` then change the upper bound to reduce the search area
      # Note: We are NOT modifying the array, just reducing the search area
      upper_bound = mid_idx - 1
    elsif mid_value < target
      # If target is on the right of `mid_idx` then change the lower bound to reduce the search area
      # Note: We are NOT modifying the array, just reducing the search area
      # Note: This last statement does NOT have to be an `elsif` and could be an `else`
      lower_bound = mid_idx + 1
    end
  end

  # The item is not in the array
  return nil
end

p "The value 21 in [7, 7, 8, 14, 82] has and index of: #{binary_search([7, 7, 8, 14, 82], 21) || "nil"}"
p "The value 14 in [7, 7, 8, 14, 82] has and index of: #{binary_search([7, 7, 8, 14, 82], 14) || "nil"}"
p "The value 7 in [7, 7, 8, 14, 82] has and index of: #{binary_search([7, 7, 8, 14, 82], 7) || "nil"}"
p "The value 82 in [7, 7, 8, 14, 82] has and index of: #{binary_search([7, 7, 8, 14, 82], 82) || "nil"}"
puts

# A stipulation of the binary_search algorithm is that in order for it to work, the array MUST be sorted.
# This is good for searching for a word in a dictionary, or a file in a directory, or a song in a playlist as examples.
# It could also be used to let you know if a word shows up in a sentence but the overhead of having to sort
# the sentence first might not make it a good choice. You would not be able to get the correct index though.
p "The value 'array' in ['an', 'an', 'and', 'array', 'array', 'english', 'english', 'fork', 'of', 'of', 'online', 'playground', 'this', 'to', 'use', 'view', 'words', 'words'] has and index of: #{binary_search(["an", "an", "and", "array", "array", "english", "english", "fork", "of", "of", "online", "playground", "this", "to", "use", "view", "words", "words"], "array") || "nil"}"
puts

################################################################################################
################################################################################################

# Task: First Occurrence (using Binary Search)
# Returns the index of the first occurrence of the target element, or `nil`

def binary_search_first_occurrence(array, target)
  # Setting the initial search area to be the entire array
  lower_bound = 0
  upper_bound = array.length - 1
  # This variable will hold the index of the first occurrence of the target if available
  first_occurrence_idx = nil

  # We are doing `<=` because we want all array elements to get checked. If we imagine an array
  # with a single element, both the upper and lower bounds would be be 0 and if we did `0 < 0` this
  # would return false and the loop would never run, even if the element was indeed our target
  while lower_bound <= upper_bound
    # This could also be written as `(lower_bound + upper_bound) / 2` but on rare occasions
    # may run into a situation where you run into an integer overflow if the array indexes get
    # too large for an integer to hold accurately
    mid_idx = lower_bound + (upper_bound - lower_bound) / 2
    mid_value = array[mid_idx]

    if mid_value == target
      # Looks like we found our target but need to keep searching to see if it the first occurrence.
      first_occurrence_idx = mid_idx

      # To do this, we should eliminate all elements to the right, since again, we are searching for
      # the first occurrence which could only be more left of this occurrence
      # We update the upper bound because we want to keep searching in the lower half of the array
      upper_bound = mid_idx - 1
    elsif mid_value > target
      # If target is on the left of `mid_idx` then change the upper bound to reduce the search area
      # Note: We are NOT modifying the array, just reducing the search area
      upper_bound = mid_idx - 1
    elsif mid_value < target
      # If target is on the right of `mid_idx` then change the lower bound to reduce the search area
      # Note: We are NOT modifying the array, just reducing the search area
      # Note: This last statement does NOT have to be an `elsif` and could be an `else`
      lower_bound = mid_idx + 1
    end
  end

  # We return the index of the first occurrence which could also still be `nil`
  return first_occurrence_idx
end

p "The first occurrence of the value 7 in [7, 7, 8, 14, 82] has an index of: #{binary_search_first_occurrence([7, 7, 8, 14, 82], 7) || "nil"}"
p "The first occurrence of the value 9 in [7, 7, 8, 14, 82] has an index of: #{binary_search_first_occurrence([7, 7, 8, 14, 82], 9) || "nil"}"
puts

################################################################################################
################################################################################################

# Task: Last Occurrence (using Binary Search)
# Returns the index of the last occurrence of the target element, or `nil`

def binary_search_last_occurrence(array, target)
  # Setting the initial search area to be the entire array
  lower_bound = 0
  upper_bound = array.length - 1
  # This variable will hold the index of the first occurrence of the target if available
  last_occurrence_idx = nil

  # We are doing `<=` because we want all array elements to get checked. If we imagine an array
  # with a single element, both the upper and lower bounds would be be 0 and if we did `0 < 0` this
  # would return false and the loop would never run, even if the element was indeed our target
  while lower_bound <= upper_bound
    # This could also be written as `(lower_bound + upper_bound) / 2` but on rare occasions
    # may run into a situation where you run into an integer overflow if the array indexes get
    # too large for an integer to hold accurately
    mid_idx = lower_bound + (upper_bound - lower_bound) / 2
    mid_value = array[mid_idx]

    if mid_value == target
      # Looks like we found our target but need to keep searching to see if it the last occurrence.
      last_occurrence_idx = mid_idx

      # To do this, we should eliminate all elements to the left, since again, we are searching for
      # the last occurrence which could only be more right of this occurrence
      # We update the upper bound because we want to keep searching in the lower half of the array
      lower_bound = mid_idx + 1
    elsif mid_value > target
      # If target is on the left of `mid_idx` then change the upper bound to reduce the search area
      # Note: We are NOT modifying the array, just reducing the search area
      upper_bound = mid_idx - 1
    elsif mid_value < target
      # If target is on the right of `mid_idx` then change the lower bound to reduce the search area
      # Note: We are NOT modifying the array, just reducing the search area
      # Note: This last statement does NOT have to be an `elsif` and could be an `else`
      lower_bound = mid_idx + 1
    end
  end

  # We return the index of the first occurrence which could also still be `nil`
  return last_occurrence_idx
end

p "The last occurrence of the value 7 in [7, 7, 8, 14, 82] has an index of: #{binary_search_last_occurrence([7, 7, 8, 14, 82], 7) || "nil"}"
p "The last occurrence of the value 9 in [7, 7, 8, 14, 82] has an index of: #{binary_search_last_occurrence([7, 7, 8, 14, 82], 9) || "nil"}"
puts

################################################################################################
################################################################################################

# Task: Square Root of a number (using Binary Search)
# Returns the square root of a given number

def binary_search_sqrt(num)
  # Any number that is less than 2 is its own square root, so return it
  return num if num < 2

  # Setting the initial bounds to be from 1 to the value of `num`
  lower_bound = 1
  upper_bound = num

  # We want to check all numbers
  while lower_bound <= upper_bound
    # This could also be written as `(lower_bound + upper_bound) / 2` but on rare occasions
    # may run into a situation where you run into an integer overflow if the array indexes get
    # too large for an integer to hold accurately
    midpoint = lower_bound + (upper_bound - lower_bound) / 2
    midpoint_squared = midpoint * midpoint
    # midpoint = (lower_bound + upper_bound) / 2

    # If the square of the midpoint is equal to the target number, 
    # we've found the square root, so return the midpoint
    if midpoint_squared == num
      return midpoint.to_f
    # If the square of the midpoint is less than the target number, the square root is somewhere 
    # in the upper half of the search space, so adjust the lower bound to midpoint + 1
    elsif midpoint_squared < num
      lower_bound = midpoint + 1
    # If the square of the midpoint is greater than the target number, the square root is somewhere 
    # in the lower half of the search space, so adjust the upper bound to midpoint - 1
    elsif midpoint_squared > num
      upper_bound = midpoint - 1
    end
  end

  # If the loop exits without finding an exact match, the closest square root is the value of the upper bound
  return (upper_bound + (num / upper_bound.to_f)) / 2
end

p "The square root of 2 is: #{binary_search_sqrt(2)}"
p "The square root of 10 is: #{binary_search_sqrt(10)}"
p "The square root of 25 is: #{binary_search_sqrt(25)}"
p "The square root of 36 is: #{binary_search_sqrt(36)}"
p "The square root of 100 is: #{binary_search_sqrt(100)}"
puts