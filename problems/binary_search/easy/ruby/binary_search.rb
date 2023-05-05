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
  lower_bound = 0
  upper_bound = nums.length - 1

  while lower_bound <= upper_bound
    mid_idx = lower_bound + (upper_bound - lower_bound) / 2
    mid_val = nums[mid_idx]

    if mid_val == target
      return mid_idx
    elsif mid_val > target
      upper_bound = mid_idx - 1
    else
      lower_bound = mid_idx + 1
    end
  end

  return -1
end

# ===================================================================== #

p search([-1,0,3,5,9,12], 9) #=> 4
p search([-1,0,3,5,9,12], 2) #=> -1