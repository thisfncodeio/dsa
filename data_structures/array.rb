# Search, Access (Read), Insert, Delete
# --------------------------------------------

# Unordered Array
##################

# Example: [14, 7, 82, 8, 7]

# - Can contain duplicates
# - Unordered

# SEARCHING
# Worst Case: Item not in array
# Time Complexity: O(n)

# ACCESS
# Worst Case: Always one step
# Time Complexity: O(1)

# INSERT
# Worst Case: N shifts of all elements to right + 1 Insertion (in front)
# Time Complexity: O(n + 1) => O(n)

# DELETE
# Worst Case: 1 Deletion (from front) + N-1 shifts of the remaining elements to left
# Time Complexity: O(1 + (n - 1)) => O(n)

################################################################
################################################################

# Ordered Array
################

# Example: [7, 7, 8, 14, 82]

# - Can contain duplicates
# - Ordered

# SEARCHING
# Worst Case: Item not in array
# Time Complexity: O(n)
#                  Note: Since this is an ordered array, we can use Binary Search which
#                        would have a time complexity of O(logn)

# ACCESS
# Worst Case: Always one step
# Time Complexity: O(1)

# INSERT
# Worst Case: N shifts of all elements to right + 1 Insertion (in front).
#             One thing to consider when inserting using an ordered array is that a search
#             must be done to maintain ordering. Depending on the element being inserted, there
#             could more more shifts and less searches or vise-versa.
# Time Complexity: O(n) + O(n + 1) => O(2n + 1) => O(n)

# DELETE
# Worst Case: 1 Deletion (from front) + N-1 shifts of the remaining elements to left
# Time Complexity: O(1 + (n - 1)) => O(n)