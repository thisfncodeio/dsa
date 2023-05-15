# BUBBLE SORT
# --------------
# Best Use Case: 1. When an array is partially or mostly already sorted
#                2. When the array size is really small
#                3. When algorithm efficiency is not a primary concern
#                4. When you want a easy to implement sorting solution
#                5. Educational and teaching since it is simple to understand and implement
#
# Worst Use Case: 1. When your dataset is large
#                 2. When you want a fast algorithm since bubble sort is one of the slowest, coming in at a time complexity of O(n^2)
#                 3. In production-level applications because of poor performance
#                 4. When you need to preserve the relative order of equal elements meaning that if two elements in the original array are considered equal, their order should remain the same after the sorting process. (This might not happen when using bubble sort)
#--------------------------
# Time Complexity: O(n^2) => For each element in the array we need to pass over the length of the array
# Space Complexity: O(1) => No matter how big or small the array gets, we only every initial the same 
#                           variables
# -----------------------------------------
# NeetCode Practice Problems: N/A
# LeetCode Practice Problems: https://leetcode.com/tag/sorting/ (Bubble sort might not be one you want to use for these problems)

# ----------------------------------------------------------------------------------------------------------------------

# TASK: Sorting array elements in ascending order
# Returns the ordered array

def bubble_sort(array)
  # Flag to track if the array is sorted
  sorted = false  
  # Index of the last element in the array
  last_idx = array.length - 1  

  # Continue iterating until the array is sorted
  # Each iteration will be a single pass from beginning to the end of the array
  while !sorted  
    # Assume the array is sorted at the beginning of each iteration.
    # This will be our stop condition to ensure we don't end up in an infinite loop
    sorted = true  

    # Iterate over each pair of adjacent elements
    (0...last_idx).each do |idx|
      # Check if the current element is greater than the next element
      if array[idx] > array[idx+1]  
        # If the current element is greater than the next element, swap the elements
        array[idx], array[idx+1] = array[idx+1], array[idx]  
        # Set the flag to false since a swap occurred
        sorted = false  
      end
    end

    # Reduce the index of the last element since the largest element is in its correct position
    last_idx -= 1  
  end

  # Return the sorted array
  return array  
end

p "[93, 13, 83, 60, 52, 28, 23, 42, 8, 73] sorted in ascending order is: #{bubble_sort([93, 13, 83, 60, 52, 28, 23, 42, 8, 73])}"
p "[55, 86, 90, 60, 1, 21, 6, 82, 66, 9] sorted in ascending order is: #{bubble_sort([55, 86, 90, 60, 1, 21, 6, 82, 66, 9])}"
p "[13, 48, 34, 32, 69, 87, 4, 74, 36, 22] sorted in ascending order is: #{bubble_sort([13, 48, 34, 32, 69, 87, 4, 74, 36, 22])}"
p "[87, 76, 81, 27, 63, 31, 68, 95, 48, 100] sorted in ascending order is: #{bubble_sort([87, 76, 81, 27, 63, 31, 68, 95, 48, 100])}"
puts

################################################################################################
################################################################################################

# TASK: Sorting array elements in descending order
# Returns the ordered array

def reverse_bubble_sort(array)
  # Flag to track if the array is sorted
  sorted = false  
  # Index of the last element in the array
  last_idx = array.length - 1  

  # Continue iterating until the array is sorted
  # Each iteration will be a single pass from beginning to the end of the array
  while !sorted  
    # Assume the array is sorted at the beginning of each iteration.
    # This will be our stop condition to ensure we don't end up in an infinite loop
    sorted = true  

    # Iterate over each pair of adjacent elements
    (0...last_idx).each do |idx|
      # Check if the current element is smaller than the next element
      if array[idx] < array[idx+1]  
        # If the current element is smaller than the next element, swap the elements
        array[idx], array[idx+1] = array[idx+1], array[idx]  
        # Set the flag to false since a swap occurred
        sorted = false  
      end
    end

    # Reduce the index of the last element since the largest element is in its correct position
    last_idx -= 1  
  end

  # Return the sorted array
  return array  
end

p "[93, 13, 83, 60, 52, 28, 23, 42, 8, 73] sorted in descending order is: #{reverse_bubble_sort([93, 13, 83, 60, 52, 28, 23, 42, 8, 73])}"
p "[55, 86, 90, 60, 1, 21, 6, 82, 66, 9] sorted in descending order is: #{reverse_bubble_sort([55, 86, 90, 60, 1, 21, 6, 82, 66, 9])}"
p "[13, 48, 34, 32, 69, 87, 4, 74, 36, 22] sorted in descending order is: #{reverse_bubble_sort([13, 48, 34, 32, 69, 87, 4, 74, 36, 22])}"
p "[87, 76, 81, 27, 63, 31, 68, 95, 48, 100] sorted in descending order is: #{reverse_bubble_sort([87, 76, 81, 27, 63, 31, 68, 95, 48, 100])}"
puts

################################################################################################
################################################################################################

# TASK: Sorting an array of object elements in ascending order
# Returns the ordered array

def objects_bubble_sort(array)
  # Flag to track if the array is sorted
  sorted = false  
  # Index of the last element in the array
  last_idx = array.length - 1  

  # Continue iterating until the array is sorted
  # Each iteration will be a single pass from beginning to the end of the array
  while !sorted  
    # Assume the array is sorted at the beginning of each iteration.
    # This will be our stop condition to ensure we don't end up in an infinite loop
    sorted = true  

    # Iterate over each pair of adjacent elements
    (0...last_idx).each do |idx|
      # Check if the objects name value is greater than the next objects name value
      if array[idx][:name] > array[idx+1][:name]  
        # If the current objects name value is greater than the next objects name value, swap the objects
        array[idx], array[idx+1] = array[idx+1], array[idx]  
        # Set the flag to false since a swap occurred
        sorted = false  
      end
    end

    # Reduce the index of the last element since the largest element is in its correct position
    last_idx -= 1  
  end

  # Return the sorted array
  return array  
end

# Even though the Bubble Sort algorithm is not considered a "stable sorting algorithm" and there is slight concern that the algorithm might not preserve the relative order of equal elements, it looks like it was able to maintain that ordering in this instance. (ie. Alice 25, still comes before Alice 20 after sorting and so do the Bobs)
p "[
  { name: 'Alice', age: 25 }, 
  { name: 'Bob', age: 30 }, 
  { name: 'Alice', age: 20 }, 
  { name: 'Bob', age: 35 }
] sorted in ascending order is: #{objects_bubble_sort([
  { name: "Alice", age: 25 }, 
  { name: "Bob", age: 30 }, 
  { name: "Alice", age: 20 }, 
  { name: "Bob", age: 35 }
])}"
puts