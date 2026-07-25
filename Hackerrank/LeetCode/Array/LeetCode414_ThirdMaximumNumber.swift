//
//  LeetCode414_ThirdMaximumNumber.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// formula
class LeetCode414_ThirdMaximumNumber {
    /// Constraints: 1 <= nums.length <= 104
    func thirdMax(_ nums: [Int]) -> Int {
        var first: Int?
        var second: Int?
        var third: Int?
        
        for num in nums {
            /// avoid duplicate
            if num == first || num == second || num == third { continue }
            
            if first == nil || num > first! {
                third = second
                second = first
                first = num
            } else if second == nil || num > second! {
                third = second
                second = num
            } else if third == nil || num > third! {
                third = num
            }
        }
        
        if let third {
            return third
        } else {
            return first ?? nums[0]
        }
    }
}

extension LeetCode414_ThirdMaximumNumber {
    func demo() {
        test01()
        test02()
        test03()
    }
    
    private func test01() {
        let nums = [3,2,1]
        let result = thirdMax(nums)
        print("result: ", result) // 1
    }
    
    private func test02() {
        let nums = [1,2]
        let result = thirdMax(nums)
        print("result: ", result) // 2
    }
    
    private func test03() {
        let nums = [2,2,3,1]
        let result = thirdMax(nums)
        print("result: ", result) // 1
    }
}
