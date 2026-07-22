//
//  LeetCode88_MergeSortedArray.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// template
class LeetCode88_MergeSortedArray {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if n == 0 {
            return
        }
        
        if m == 0 {
            nums1 = nums2
            return
        }
        
        var i = m - 1
        var j = n - 1
        var k = (m + n) - 1
        
        while (j >= 0) {
            if i >= 0 && nums1[i] > nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
            }
            
            k -= 1
        }
    }
}

extension LeetCode88_MergeSortedArray {
    func demo() {
        test01()
        test02()
        test03()
        test04()
    }
    
    private func test01() {
        var nums1 = [1,2,3,0,0,0]
        let m = 3
        let nums2 = [2,5,6]
        let n = 3
        
        merge(&nums1, m, nums2, n)
        print(nums1) // [1,2,2,3,5,6]
    }
    
    private func test02() {
        var nums1 = [1]
        let m = 1
        let nums2 = [Int]()
        let n = 0
        
        merge(&nums1, m, nums2, n)
        print(nums1) // [1]
    }
    
    private func test03() {
        var nums1 = [0]
        let m = 0
        let nums2 = [1]
        let n = 1
        
        merge(&nums1, m, nums2, n)
        print(nums1) // [1]
    }
    
    private func test04() {
        var nums1 = [2,0]
        let m = 1
        let nums2 = [1]
        let n = 1
        
        merge(&nums1, m, nums2, n)
        print(nums1) // [2,2]
    }
}
