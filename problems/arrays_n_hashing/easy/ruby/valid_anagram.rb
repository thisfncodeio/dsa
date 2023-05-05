# Valid Anagram
# https://leetcode.com/problems/valid-anagram/
# Given two strings s and t, return true if t is an anagram of s, and false otherwise.
# An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

# VERSION 1:
# Runtime: 137 ms
# Memory: 217.8 mb
# Note: Uses the build in `chars`, `sort`, and `join` methods. The benefit of this solution is that we don't have to use any extra memory like in the other solutions
#       The downside is that the string now first needs to be sorted.

# -------------------------------------

# def is_anagram(s, t)
#   # Convert both strings to arrays of characters, sort each array alphabetically, then join them back into a string
#   # If the resulting strings are equal, then they are anagrams of each other, so return true
#   # Otherwise, return false
#   s.chars.sort.join == t.chars.sort.join
# end

# ===================================================================== #

# VERSION 2:
# Runtime: 156 ms
# Memory: 217.1 mb
# Note: Uses a helper method to turn both strings into hashes

# -------------------------------------

# def is_anagram(s, t)
#   # Hash the characters in the strings and compare the resulting hashes
#   hashify(s) == hashify(t)
# end

# def hashify(string)
#   # Split the string into an array of characters, then reduce the array into a hash
#   string.split("").reduce(Hash.new(0)) do |hash, letter|
#     # For each character in the array, increment the frequency count in the hash
#     hash[letter] += 1
#     hash
#   end
# end

# ===================================================================== #

# VERSION 3:
# Runtime: 138 ms
# Memory: 211.6 mb
# Note: The strings must first match in length. We use a hash to keep a running (ping/pong) tally

# -------------------------------------

def is_anagram(s, t)
  # If the length of the strings is different, they cannot be anagrams.
  if s.length != t.length
    return false
  end

  # Initialize a new hash with default value 0.
  # This hash will store the frequency of each letter in the strings.
  hash = Hash.new(0)
  
  # Iterate through the characters of both strings.
  s.each_char.with_index do |_, idx|
    # Get the current character from each string.
    current_s_letter = s[idx]
    current_t_letter = t[idx]

    # Increment the frequency of the current character in s and decrement the frequency of the same character in t.
    hash[current_s_letter] += 1
    hash[current_t_letter] -= 1
  end

  # Check if all the values in the hash are zero, which means the two strings are anagrams.
  hash.all? { |_, value| value.zero? }
end

# ===================================================================== #

p is_anagram("anagram", "nagaram") #=> true
p is_anagram("rat", "car") #=> false