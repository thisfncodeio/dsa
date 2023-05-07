# Find Minimum in Rotated Sorted Array
# https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
# Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:
# - [4,5,6,7,0,1,2] if it was rotated 4 times.
# - [0,1,2,4,5,6,7] if it was rotated 7 times.
# Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].
# Given the sorted rotated array nums of unique elements, return the minimum element of this array.
# You must write an algorithm that runs in O(log n) time.

# -------------------------------------

# Pattern to solve similar problem (How would you know what the best algorithm was to solve the problem?): <Pattern>

# -------------------------------------

# VERSION 1:
# Runtime: 85 ms
# Memory: 211.1 mb
# Note: Uses Two Pointers (Sliding Window) Algorithm (Linear Search). I believe this is an O(n) time complexity algorithm since every element is being checked.

# -------------------------------------

def find_min(nums)
  # Initialize variables "left" and "right" to represent the start and end indices of the list.
  left = 0
  right = nums.length - 1

  # Use a while loop to iterate through the list until "left" and "right" are equal.
  while left != right
    # If the value at the left index is greater than the value at the right index,
    # move the left pointer one step to the right.
    if nums[left] > nums[right]
      left += 1
    # If the value at the right index is greater than the value at the left index,
    # move the right pointer one step to the left.
    elsif nums[right] > nums[left]
      right -= 1
    # If the values at both indices are equal, return the value at the left index as the minimum value.
    else
      return nums[left]
    end
  end
end

# ===================================================================== #

# VERSION 2:
# Runtime: 104 ms
# Memory: 211.3 mb
# Note: Using the Binary Search Algorithm (O(log n)). For whatever reason, it's actually running slower than Version 1 which uses Two Pointers and runs in O(n)

# -------------------------------------

def find_min(nums)
  # Initialize variables "left" and "right" to represent the start and end indices of the list.
  left = 0
  right = nums.length - 1

  # Use a while loop to iterate through the list until "left" becomes greater than or equal to "right".
  while left < right
    # Calculate the middle index between "left" and "right".
    mid = left + (right - left) / 2

    # If the value at the middle index is greater than the value at the right index,
    # update "left" to be one position after the middle index.
    if nums[mid] > nums[right]
      left = mid + 1
    # If the value at the middle index is less than or equal to the value at the right index,
    # update "right" to be the middle index.
    else
      right = mid
    end
  end

  # Return the value at the "left" index as the minimum value.
  return nums[left]
end

# ===================================================================== #

p find_min([3,4,5,1,2]) #=> 1
p find_min([4,5,6,7,0,1,2]) #=> 0
p find_min([11,13,15,17]) #=> 11