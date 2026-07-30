//
//  LeetCode350_IntersectionOfTwoArraysII.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// hash map
class LeetCode350_IntersectionOfTwoArraysII {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int: Int]()
        var result = [Int]()
        
        for num in nums1 {
            map[num] = (map[num] ?? 0) + 1
        }
        
        for num in nums2 {
            if let value = map[num], value > 0 {
                result.append(num)
                map[num] = value - 1
            } /* else {
                continue
            } */
        }
        
        return result
    }
}

extension LeetCode350_IntersectionOfTwoArraysII {
    func demo() {
        test01()
        test02()
    }
    
    private func test01() {
        let nums1 = [1,2,2,1]
        let nums2 = [2,2]
        let output = intersect(nums1, nums2)
        print(output) /// [2,2]
    }
    
    private func test02() {
        let nums1 = [4,9,5]
        let nums2 = [9,4,9,8,4]
        let output = intersect(nums1, nums2)
        print(output) /// [4,9] or [[9,4]]
    }
}
