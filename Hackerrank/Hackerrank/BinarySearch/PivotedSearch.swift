//
//  PivotedSearch.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 31/12/25.
//

import Foundation

class PivotedSearch {
    func demo() {
        let nums = [1609466400, 1609470000, 1609473600, 1609459200, 1609462800]
        let target = 1609459200
        let output = searchRotatedTimestamps(nums: nums, target: target)
        print(output) // 3
    }
    
    private func searchRotatedTimestamps(nums: [Int], target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        var left = 0
        var right = nums.count - 1
        var mid = 0
        
        while left <= right {
            // print("left: \(left)")
            // print("right: \(right)")
            
            mid = left + (right - left) / 2
            // print("mid: \(mid)")
            
            if nums[mid] == target {
                return mid
            }
            
            if nums[left] == target {
                return left
            }
            
            if nums[right] == target {
                return right
            }
            
            // pivot point?
            // [1, 2, 3, 4, 5] -> [3, 4, 5, 1, 2]
            // [3, 4, 0, 1, 2]
            
            if nums[left] < nums[mid] { // left is sorted
                if nums[left] < target && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if nums[left] < target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        
        return -1
    }
}
