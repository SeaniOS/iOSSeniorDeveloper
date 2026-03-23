//
//  15_3Sum.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 23/3/26.
//

import Foundation

class TwoPointers_15_3Sum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        // sort asc
        let nums = nums.sorted()
        print(nums)
        
        // first loop for a
        for i in 0..<nums.count {
            let a = nums[i]
            if i > 0 && a == nums[i - 1] {
                continue
            }
            
            // two pointers for b & c
            var left = i + 1
            var right = nums.count - 1
            
            while left < right {
                let b = nums[left]
                let c = nums[right]
                
                let sum = a + b + c
                
                if sum < 0 {
                    left += 1
                } else if sum > 0 {
                    right -= 1
                } else {
                    results.append([a, b, c])
                    left += 1
                    /*
                    let nums = [0,0,0,0]
                    let result = [[0, 0, 0], [0, 0, 0]]
                     */
                    while nums[left] == nums[left-1] && left < right {
                        left += 1
                    }
                }
            }
        }
        
        return results
    }
}

extension TwoPointers_15_3Sum {
    func test() {
        print("TwoPointers_15_3Sum.test")
        
        // test1()
        test2()
    }
    
    private func test1() {
        let nums = [-1,0,1,2,-1,-4]
        let result = threeSum(nums)
        print(result)
    }
    
    private func test2() {
        let nums = [0,0,0,0]
        let result = threeSum(nums)
        print(result)
    }
}

/*
 Example 1:

 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 */
