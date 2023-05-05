# Search a 2D Matrix
# https://leetcode.com/problems/search-a-2d-matrix/
# You are given an m x n integer matrix matrix with the following two properties:
# - Each row is sorted in non-decreasing order.
# - The first integer of each row is greater than the last integer of the previous row.
# Given an integer target, return true if target is in matrix or false otherwise.
# You must write a solution in O(log(m * n)) time complexity.

# VERSION 1:
# Runtime: 72 ms
# Memory: 211.1 mb
# Note: First I find the sub-array that I need to do my search in by checking the first and last indexes of each sub-array to
#       determine if the target falls within the arrays range of integers. Then I use the basic Binary Search algorithm on that array.

# -------------------------------------

def search_matrix(matrix, target)
  # Loop through each array in the matrix
  matrix.each do |array|
    # Initialize left and right pointers
    left = 0
    right = array.length - 1

    # Check if target is within the current array
    if array[left] <= target && array[right] >= target
      # Use binary search to find the target in the current array
      while left <= right
        mid_idx = left + (right - left) / 2

        if array[mid_idx] == target
          return true
        elsif array[mid_idx] < target
          left = mid_idx + 1
        else
          right = mid_idx - 1
        end
      end

      # If the target is not found in the current array, return false
      return false
    end
  end

  # If the target is not found in any of the arrays, return false
  return false
end

# ===================================================================== #

p search_matrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3) #=> true
p search_matrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13) #=> false
p search_matrix([[1]], 0) #=> false
p search_matrix([[1]], 1) #=> true
p search_matrix([[1,3]], 3) #=> true