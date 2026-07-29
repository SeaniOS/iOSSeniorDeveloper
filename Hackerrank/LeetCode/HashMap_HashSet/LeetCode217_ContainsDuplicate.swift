//
//  LeetCode217_ContainsDuplicate.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// hash set
class LeetCode217_ContainsDuplicate {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set: Set<Int> = []
        for num in nums {
            if set.contains(num) {
                return true
            }
            set.insert(num)
        }
        return false
    }
}

extension LeetCode217_ContainsDuplicate {
    func demo() {
        test01()
        test02()
        test03()
    }
    
    private func test01() {
        let nums = [1,2,3,1]
        let result = containsDuplicate(nums) /// true
        print(result)
    }
    
    private func test02() {
        let nums = [1,2,3,4]
        let result = containsDuplicate(nums) /// false
        print(result)
    }
    
    private func test03() {
        let nums = [1,1,1,3,3,4,3,2,4,2]
        let result = containsDuplicate(nums) /// true
        print(result)
    }
}
