# Koko Eating Bananas
# https://leetcode.com/problems/koko-eating-bananas/
# Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours.
# Koko can decide her bananas-per-hour eating speed of k. Each hour, she chooses some pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.
# Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.
# Return the minimum integer k such that she can eat all the bananas within h hours.

# VERSION 1
# Runtime: Time Limit Exceeded on LC
# Memory: Time Limit Exceeded on LC
# Note: Wanted to grab the possible eating speeds by creating a descending array from the max pile down to 1 which is the fastest eating speed to the slowest eating.
#       I believe the algorithm times out on larger numbers because of this.

# -------------------------------------

def min_eating_speed(piles, h)
  # Initialize the eating speed to the maximum pile size
  eating_speed = piles.max  
  # Generate an array of possible eating speeds in descending order
  possible_eating_speeds = (eating_speed.downto(1)).to_a  
  
  # Initialize the left and right pointers for binary search
  left = 0
  right = possible_eating_speeds.length - 1  
  
  # Perform binary search until left pointer crosses the right pointer
  while left <= right  
    # Calculate the middle index
    mid_idx = left + (right - left) / 2  
    # Get the eating speed at the middle index
    current_eating_speed = possible_eating_speeds[mid_idx]  

    # Initialize the variable to track the total time taken to finish eating
    time_taken_to_finish = 0  
    # Iterate over each pile
    piles.each do |pile|  
      # Calculate the time taken to finish the current pile using the current eating speed
      time_taken_to_finish += (pile/current_eating_speed.to_f).ceil  
    end

    # If the total time taken is less than or equal to the available hours
    if time_taken_to_finish <= h  
      # Move the left pointer to the right
      left = mid_idx + 1  
      # Update the eating speed if it's lower than the current value
      eating_speed = possible_eating_speeds[mid_idx] if possible_eating_speeds[mid_idx] < eating_speed  
      # If the total time taken is greater than or equal to the available hours
    elsif time_taken_to_finish >= h  
      # Move the right pointer to the left
      right = mid_idx - 1  
    end
  end

  # Return the minimum eating speed
  eating_speed  
end

# ===================================================================== #

# VERSION 2
# Runtime: 408 ms
# Memory: 212.8 mb
# Note: Pretty much the same as Version 1 without creating the extra array which saves time. Also, instead of looking that the indexes of each number,
#       I'm just using the number directly itself. I am also going in ascending order instead of descending. Solution is still pretty slow for whatever reason.

# -------------------------------------

def min_eating_speed(piles, h)
  # Initialize the left pointer to the minimum possible eating speed
  left = 1  
  # Initialize the right pointer to the maximum pile size
  right = piles.max  
  # Initialize the eating speed to the maximum pile size
  eating_speed = right  

  # Perform binary search until left pointer crosses the right pointer
  while left <= right  
    # Calculate the middle eating speed
    current_eating_speed = left + (right - left) / 2  

    # Initialize the variable to track the total time taken to finish eating
    time_taken_to_finish = 0 
    # Iterate over each pile 
    piles.each do |pile|  
      # Calculate the time taken to finish the current pile using the current eating speed
      time_taken_to_finish += (pile/current_eating_speed.to_f).ceil  
    end

    # If the total time taken is less than or equal to the available hours
    if time_taken_to_finish <= h  
      # Move the right pointer to the left
      right = current_eating_speed - 1  
      # Update the eating speed if it's lower than the current value
      eating_speed = current_eating_speed if current_eating_speed < eating_speed  
    # If the total time taken is greater than or equal to the available hours
    elsif time_taken_to_finish >= h  
      # Move the left pointer to the right
      left = current_eating_speed + 1  
    end
  end

  # Return the minimum eating speed
  eating_speed  
end


# ===================================================================== #

p min_eating_speed([3,6,7,11], 8) #=> 4
p min_eating_speed([30,11,23,4,20], 5) #=> 30
p min_eating_speed([30,11,23,4,20], 6) #=> 23
p min_eating_speed([312884470], 312884469) #=> 23