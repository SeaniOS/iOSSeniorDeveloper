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
