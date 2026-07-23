//
//  LeetCode26_RemoveDuplicatesFromSortedArray.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// template
class LeetCode26_RemoveDuplicatesFromSortedArray {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var k = 1
        var i = 0
        var j = 1 // start from the second position
        
        while j < nums.count { // loop through entire nums
            if nums[j] == nums[i] {
                nums[j] = -1
            } else {
                k += 1 // found a new value
                i += 1 // update the next position
                nums[i] = nums[j]
                
                if i != j {
                    nums[j] = -1
                }
            }
            
            j += 1
        }
        
        return k
    }
}

extension LeetCode26_RemoveDuplicatesFromSortedArray {
    func demo() {
        test01()
        test02()
    }
    
    private func test01() {
        var nums = [1,1,2]
        let k = removeDuplicates(&nums)
        print(k) // 2
        print(nums) // [1,2,_]
    }
    
    private func test02() {
        var nums = [0,0,1,1,1,2,2,3,3,4]
        let k = removeDuplicates(&nums)
        print(k) // 5
        print(nums) // [0,1,2,3,4,_,_,_,_,_]
    }
}
