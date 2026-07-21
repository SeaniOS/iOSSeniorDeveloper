//
//  LeetCode27_RemoveElement.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// two pointers
class LeetCode27_RemoveElement {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var j = nums.count - 1
        
        while i <= j { /// i  <= j
            if nums[i] != val {
                i += 1
            } else {
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                j -= 1
            }
        }
        return i /// return i ~ count
    }
}

extension LeetCode27_RemoveElement {
    func demo() {
        test01()
    }
    
    private func test01() {
        var nums = [3,2,2,3]
        let val = 3
        let output = removeElement(&nums, val) // 2
        // nums = [2,2,_,_]
        print(output)
    }
}
