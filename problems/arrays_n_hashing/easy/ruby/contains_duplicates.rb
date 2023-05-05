# Contains Duplicates
# https://leetcode.com/problems/contains-duplicate/
# Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

# VERSION 1:
# Runtime: 134 ms
# Memory: 219 mb
# Note: Uses built in `uniq` method

# -------------------------------------

# def contains_duplicate(nums)
#   # Check if the length of the list is the same as the length of the list with unique elements
#   # If they are not the same, there must be duplicates in the list
#   !(nums.length == nums.uniq.length)
# end

# ===================================================================== #

# VERSION 2:
# Runtime: N/A
# Memory: N/A
# Note: Time Limit Exceeded (When array length gets large. `include?` has to search the entire array which is time-consuming)

# -------------------------------------

# def contains_duplicate(nums)
#   # Create an empty array to store unique numbers
#   uniq_nums = []

#   # Iterate through the array of numbers
#   nums.each do |num|
#     # Check if the number is already in the unique numbers array
#     if uniq_nums.include?(num)
#       # If it is, return true (the array contains duplicates)
#       return true
#     end

#     # If the number is not in the unique numbers array, add it to the array
#     uniq_nums << num
#   end

#   # If the loop completes without finding any duplicates, return false
#   return false
# end

# ===================================================================== #

# VERSION 3:
# Runtime: 131 ms
# Memory: 224.6 mb
# Note: Hashes are more efficient than arrays

# -------------------------------------

def contains_duplicate(nums)
  # Create an empty hash table to store the elements of the array
  nums_hash = {}  

  # Loop through each element in the array
  nums.each do |num|  
    # If the current element is already in the hash table, return true
    if nums_hash.has_key?(num)  
      return true
    end

    # Otherwise, add the current element to the hash table
    nums_hash[num] = nil  
  end

  # If we reach the end of the loop, it means there are no duplicates in the array
  return false  
end

# ===================================================================== #

p contains_duplicate([1,2,3,1]) #=> true
p contains_duplicate([1,2,3,4]) #=> false
p contains_duplicate([1,1,1,3,3,4,3,2,4,2]) #=> true