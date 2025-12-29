//
//  FindFirstOccurrence.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 29/12/25.
//

import Foundation

class FindFirstOccurrence {
    func demo() {
        let nums = [1, 2, 3, 4, 5]
        let target = 3
        
        let output = findFirstOccurrence(nums: nums, target: target)
        print(output)
    }
    
    private func findFirstOccurrence(nums: [Int], target: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        var mid = 0
        var index = -1
        
        while low <= high {
            mid = low + (high - low) / 2
            
            if nums[mid] == target {
                index = mid
                high = mid - 1
            } else if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return index
    }
}
