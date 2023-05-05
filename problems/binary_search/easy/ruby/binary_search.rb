# Binary Search
# https://leetcode.com/problems/binary-search/
# Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
# You must write an algorithm with O(log n) runtime complexity.

# VERSION 1:
# Runtime: 96 ms
# Memory: 213.9 mb
# Note: Uses the basic Binary Search algorithm

# -------------------------------------

def search(nums, target)
  # Set the initial range of the search to cover the whole array.
  lower_bound = 0
  upper_bound = nums.length - 1

  # Continue searching while the range is not empty.
  while lower_bound <= upper_bound
    # Calculate the middle index and value of the current range.
    mid_idx = lower_bound + (upper_bound - lower_bound) / 2
    mid_val = nums[mid_idx]

    # If the middle value is equal to the target, return its index.
    if mid_val == target
      return mid_idx
    # If the middle value is greater than the target, search the left half of the current range.
    elsif mid_val > target
      upper_bound = mid_idx - 1
    # If the middle value is less than the target, search the right half of the current range.
    else
      lower_bound = mid_idx + 1
    end
  end

  # If the target is not found, return -1.
  return -1
end

# ===================================================================== #

p search([-1,0,3,5,9,12], 9) #=> 4
p search([-1,0,3,5,9,12], 2) #=> -1