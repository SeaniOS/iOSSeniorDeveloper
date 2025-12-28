//
//  main.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 28/12/25.
//

import Foundation

print("Hello, World!")

let orderNumbers = [3, 4, -1, 1]
let output = findSmallestMissingPositiveSolution(orderNumbers: orderNumbers)
print(output)

/*
 We want the smallest positive missing integer.
 
 Start with [3, 4, -1, 1]
 n = 4
 - i=0: value 3 ⇒ swap with index 2 ⇒ [-1, 4, 3, 1]
 - i=0: value -1 is out of range ⇒ move on
 - i=1: value 4 ⇒ swap with index 3 ⇒ [-1, 1, 3, 4]
 - i=1: value 1 ⇒ swap with index 0 ⇒ [1, -1, 3, 4]
 ...
 - i=1: value -1 is out of range ⇒ move on
 - i=2: value 3 nums[i] = 3, nums[nums[i] - 1] = nums[3-1] = nums[2] = 3 ⇒ move on
 - i=3: similarity ⇒ move on
 ...
 - now 1 at index 0, 3 at 2, 4 at 3; -1 remains at index 1
 
 Scan from index 0:
 index 0 has 1 (correct), index 1 has -1 (not 2) ⇒ missing positive is 2
 */

/// O(n) time
/// O(1) extra space
func findSmallestMissingPositiveSolution(orderNumbers: [Int]) -> Int {
    var nums = orderNumbers // Create a mutable copy
    let n = nums.count // Place each number in its correct position // 4
    var i = 0
    while i < n {
        // If the current number is positive, within range, and not in its correct position
        if nums[i] > 0 && nums[i] <= n && nums[nums[i] - 1] != nums[i] {
            print("⚡️ index: \(i)")
            // Swap to put it in the right place
            let temp = nums[nums[i] - 1] // i = 0, temp = nums[3-1] = nums[2] = -1
            print("temp: \(temp)")
            nums[nums[i] - 1] = nums[i] // nums[2] = 3
            nums[i] = temp
        } else {
            i += 1
        }
    }
    
    // Find the first position where the number doesn't match the position
    for i in 0..<n {
        if nums[i] != i + 1 {
            return i + 1
        }
    }
    
    // If all positions are correct, the answer is n+1
    return n + 1
}

