//
//  LeetCode1480_RunningSum.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// sum | formula
class LeetCode1480_RunningSum {
    func runningSum2(_ nums: [Int]) -> [Int] {
        var sum = nums[0]
        var output = nums
        
        for i in 1..<nums.count {
            output[i] = nums[i] + sum
            sum = sum + nums[i]
        }
        
        return output
    }
    
    func runningSum(_ nums: [Int]) -> [Int] {
        var output = nums
        
        for i in 1..<nums.count {
            output[i] = output[i-1] + nums[i]
        }
        
        return output
    }
}

extension LeetCode1480_RunningSum {
    func demo() {
        test01()
        test02()
        test03()
    }
    
    private func test01() {
        let nums = [1,2,3,4]
        let output = runningSum(nums) // [1,3,6,10]
        print(output) // fl
    }
    
    private func test02() {
        let nums = [1,1,1,1,1]
        let output = runningSum(nums) // [1,2,3,4,5]
        print(output) // fl
    }
    
    private func test03() {
        let nums = [3,1,2,10,1]
        let output = runningSum(nums) // [3,4,6,16,17]
        print(output) // fl
    }
}
