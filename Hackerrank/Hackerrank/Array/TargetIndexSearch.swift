//
//  TargetIndexSearch.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 29/12/25.
//

import Foundation

class TargetIndexSearch {
    func demo() {
        let nums = [1, 2, 3, 4, 5]
        let target = 3
        
        let output = binarySearch(nums: nums, target: target)
        print(output)
    }
    
    /*
     Explanation:
     Input:
        nums = [1, 2, 3, 4, 5]
        target = 3
     Output: 2
     
     Initialize low = 0, high = 4. Compute mid = (0 + 4) // 2 = 2. nums[2] = 3 matches target, so return 2.
     
     
     Input:
        nums = [2, 4, 6, 8, 10, 12, 14, 16]
        target = 16
     Output: 7
     
     Start with low = 0, high = 7. mid = (0 + 7) // 2 = 3, nums[3] = 8 < 16, so set low = 4.
     Now mid = (4 + 7) // 2 = 5, nums[5] = 12 < 16, so low = 6.
     Next mid = (6 + 7) // 2 = 6, nums[6] = 14 < 16, so low = 7.
     Finally mid = (7 + 7) // 2 = 7, nums[7] = 16 equals target, return 7.
     */
    
    private func binarySearch(nums: [Int], target: Int) -> Int {
        // print("nums: \(nums)")
        // print("target: \(target)")
        var low = 0
        var high = nums.count - 1
        var mid = 0
        
        while low <= high {
            // mid = (low + high) / 2
            mid = low + (high - low) / 2
            
            if nums[mid] == target {
                return mid
            }
            
            if nums[mid] < target {
                low = mid + 1
            }
            else {
                high = mid - 1
            }
        }
        
        return -1
    }
}
