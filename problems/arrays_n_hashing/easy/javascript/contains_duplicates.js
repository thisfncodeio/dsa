// Contains Duplicates
// https://leetcode.com/problems/contains-duplicate/
// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

// VERSION 1:
// Runtime: 2227 ms
// Memory: 50.2 mb
// Note: 

// -------------------------------------

// var containsDuplicate = (nums) => {
//   let uniq = [];
//   let dupes = false;

//   nums.forEach((num) => {
//     if (uniq.indexOf(num) != -1) {
//       dupes = true;
//     } else {
//       uniq.push(num);
//     }
//   });

//   return dupes;
// };

// ===================================================================== //

// VERSION 2:
// Runtime: 122 ms
// Memory: 50.8 mb
// Note: Uses the Map data structure

// -------------------------------------

// var containsDuplicate = (nums) => {
//   const numMap = new Map();
//
//   for (let i = 0; i < nums.length; i++) {
//     if (numMap.has(nums[i])) {
//       return true;
//     } else {
//       numMap.set(nums[i]);
//     }
//   }
//   return false;
// };

// ===================================================================== //

// VERSION 3:
// Runtime: 165 ms
// Memory: 50.6 mb
// Note: Uses the Set data structure

// -------------------------------------

var containsDuplicate = (nums) => {
  return [...new Set(nums)].length != nums.length;
};

// ===================================================================== //

console.log(containsDuplicate([1,2,3,1])) //=> true
console.log(containsDuplicate([1,2,3,4])) //=> false
console.log(containsDuplicate([1,1,1,3,3,4,3,2,4,2])) //=> true