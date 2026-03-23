//
//  1464_MaximumProductOfTwoElements.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 9/3/26.
//

import Foundation

/*
 Given the array of integers nums, you will choose two different indices i and j of that array.
 Return the maximum value of (nums[i]-1)*(nums[j]-1).
 
 Constraints:
 2 <= nums.length <= 500
 */
class Heap_1464_MaximumProductOfTwoElements {
    /// 0 ms
    /// 19.36 MB
    func _maxProduct(_ nums: [Int]) -> Int {
        var maxHeap = MaxHeap<Int>()
        
        for num in nums {
            maxHeap.add(num)
        }
        
        let first = maxHeap.poll()!
        let second = maxHeap.poll()!
        return (first-1) * (second-1)
    }
}

extension Heap_1464_MaximumProductOfTwoElements {
    /// 0 ms
    /// 19.43 MB
    func maxProduct(_ nums: [Int]) -> Int {
        var first = -1
        var second = -1
        
        for num in nums {
            if (num > first) {
                second = first
                first = num
            } else if (num > second) {
                second = num
            }
        }
        
        return (first-1) * (second-1)
    }
}

extension Heap_1464_MaximumProductOfTwoElements {
    func demo() {
        testCase1()
        testCase2()
        testCase3()
    }
    
    private func testCase1() {
        let nums = [3,4,5,2]
        let output = maxProduct(nums)
        print(output)
        // 12
    }
    
    private func testCase2() {
        let nums = [1,5,4,5]
        let output = maxProduct(nums)
        print(output)
        // 16
    }
    
    private func testCase3() {
        let nums = [3,7]
        let output = maxProduct(nums)
        print(output)
        // 12
    }
}
