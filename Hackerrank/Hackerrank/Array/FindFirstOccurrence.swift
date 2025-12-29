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
    
    /*
     Input:
        nums = [1, 2, 3, 4, 5]
        target = 3
     
     Output: 2
     
     Explanation:
        We perform binary search on [1,2,3,4,5].

     low=0, high=4 → mid=2 → nums[2]=3 equals target. Record result=2, then search left half.
     Update high=mid-1=1. Now low=0, high=1 → mid=0 → nums[0]=1 < target, so move low to mid+1=1.
     low=1, high=1 → mid=1 → nums[1]=2 < target, so move low to mid+1=2.
     Now low(2)>high(1), terminate. The first occurrence found is at index 2.
     */
    
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
