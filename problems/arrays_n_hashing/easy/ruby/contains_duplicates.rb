# Contains Duplicates
# https://leetcode.com/problems/contains-duplicate/
# Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

# VERSION 1:
# Runtime: 134 ms
# Memory: 219 mb
# Note: Uses built in `uniq` method

# -------------------------------------

# def contains_duplicate(nums)
#   !(nums.length == nums.uniq.length)
# end

# ===================================================================== #

# VERSION 2:
# Runtime: N/A
# Memory: N/A
# Note: Time Limit Exceeded (When array length gets large. `include?` has to search the entire array which is time-consuming)

# -------------------------------------

# def contains_duplicate(nums)
#   uniq_nums = []

#   nums.each do |num|
#     if uniq_nums.include?(num)
#       return true
#     end

#     uniq_nums << num
#   end

#   return false
# end

# ===================================================================== #

# VERSION 3:
# Runtime: 131 ms
# Memory: 224.6 mb
# Note: Hashes are more efficient than arrays

# -------------------------------------

def contains_duplicate(nums)
  nums_hash = {}

  nums.each do |num|
    if nums_hash.has_key?(num)
      return true
    end

    nums_hash[num] = nil
  end

  return false
end

# ===================================================================== #

p contains_duplicate([1,2,3,1]) #=> true
p contains_duplicate([1,2,3,4]) #=> false
p contains_duplicate([1,1,1,3,3,4,3,2,4,2]) #=> true