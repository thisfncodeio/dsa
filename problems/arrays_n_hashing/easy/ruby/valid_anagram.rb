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
#   s.chars.sort.join == t.chars.sort.join
# end

# ===================================================================== #

# VERSION 2:
# Runtime: 156 ms
# Memory: 217.1 mb
# Note: Uses a helper method to turn both strings into hashes

# -------------------------------------

# def is_anagram(s, t)
#   hashify(s) == hashify(t)
# end

# def hashify(string)
#   string.split("").reduce(Hash.new(0)) do |hash, letter|
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
  if s.length != t.length
    return false
  end

  hash = Hash.new(0)
  
  s.each_char.with_index do |_, idx|
    current_s_letter = s[idx]
    current_t_letter = t[idx]

    hash[current_s_letter] += 1
    hash[current_t_letter] -= 1
  end

  hash.all? { |_, value| v.zero? }
end

# ===================================================================== #

p is_anagram("anagram", "nagaram") #=> true
p is_anagram("rat", "car") #=> false