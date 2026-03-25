//
//  27_RemoveElement.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 25/3/26.
//

import Foundation

class TwoPointers_27_RemoveElement {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        /*
        if nums.count == 0 {
            return 0
        }

        if nums.count == 1 {
            return (nums[0] != val) ? 1 : 0
        }
        */
        while left <= right { // left <= right instead of left < right
            if nums[left] != val {
                left += 1
            } else {
                // swap
                let temp = nums[left]
                nums[left] = nums[right]
                nums[right] = temp
                
                right -= 1
            }
        }
        
        // print(nums)
        return left // left instead of left + 1
    }
}

extension TwoPointers_27_RemoveElement {
    func test() {
        print("TwoPointers_RemoveElement.test")
        var nums = [3,2,2,3]
        let val = 3
        let result = removeElement(&nums, val)
        
        print(result)
        // output: 2, nums = [2,2,_,_]
    }
}
