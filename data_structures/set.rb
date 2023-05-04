# Array-based Set
##################

# Example: [14, 7, 82, 8, 16]

# - Cannot contain duplicates
# - Unordered

# SEARCHING
# Worst Case: Item not in array
# Time Complexity: O(n)

# ACCESS
# Worst Case: Always one step
# Time Complexity: O(1)

# INSERT
# Worst Case: N shifts of all elements to right + 1 Insertion (in front)
# Time Complexity: O(n) + O(n + 1) => O(2n + 1) => O(n)
#                  Note: One thing to consider when inserting using an ordered array is that since duplicates
#                  are not allowed in a set, the array needs to be searched in it's entirety, O(n), before
#                  an insertion can be made, N shifts of all elements to right + 1 Insertion (in front)

# DELETE
# Worst Case: 1 Deletion (from front) + N-1 shifts of the remaining elements to left
# Time Complexity: O(1 + (n - 1)) => O(n)

################################################################
################################################################