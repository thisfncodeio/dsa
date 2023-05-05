// Contains Duplicates
// https://leetcode.com/problems/contains-duplicate/
// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

// VERSION 1:
// Runtime: 2227 ms
// Memory: 50.2 mb
// Note: 

// -------------------------------------

// var containsDuplicate = (nums) => {
//   // Initialize an empty array to store unique values
//   let uniq = [];
//   // Initialize a boolean variable to keep track of whether duplicates are found
//   let dupes = false;

//   // Iterate through each element in the array
//   nums.forEach((num) => {
//     // If the current element is already in the unique array, set dupes to true
//     if (uniq.indexOf(num) != -1) {
//       dupes = true;
//     } else {
//       // Otherwise, add the current element to the unique array
//       uniq.push(num);
//     }
//   });

//   // Return the value of the dupes variable
//   return dupes;
// };

// ===================================================================== //

// VERSION 2:
// Runtime: 122 ms
// Memory: 50.8 mb
// Note: Uses the Map data structure

// -------------------------------------

// var containsDuplicate = (nums) => {
//   // Create a new Map object
//   const numMap = new Map();

//   // Loop through each number in 'nums'
//   for (let i = 0; i < nums.length; i++) {
//     // If 'numMap' has the number as a key, return 'true' since it is a duplicate
//     if (numMap.has(nums[i])) {
//       return true;
//       // Otherwise, set the number as a key in 'numMap'
//     } else {
//       numMap.set(nums[i]);
//     }
//   }
//   // Return 'false' if no duplicates were found
//   return false;
// };

// ===================================================================== //

// VERSION 3:
// Runtime: 165 ms
// Memory: 50.6 mb
// Note: Uses the Set data structure

// -------------------------------------

// var containsDuplicate = (nums) => {
//   // Use a Set to store the unique values of the input array
//   const uniqueNums = new Set(nums);

//   // Spread the Set back into an array to compare lengths
//   // and check for duplicates
//   const uniqueArr = [...uniqueNums];
//   const hasDuplicates = uniqueArr.length !== nums.length;

//   // Return whether duplicates were found
//   return hasDuplicates;
// };

// ===================================================================== //

console.log(containsDuplicate([1,2,3,1])) //=> true
console.log(containsDuplicate([1,2,3,4])) //=> false
console.log(containsDuplicate([1,1,1,3,3,4,3,2,4,2])) //=> true