//
//  LongestArithmeticSubsequenceWithGivenDifference.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 31/12/25.
//

import Foundation

class LongestArithmeticSubsequenceWithGivenDifference {
    func demo() {
        let arr = [8, 1, -1, 0, 3, 6, 2, 4, 5, 7, 9]
        let k = 2
        let output = findLongestArithmeticProgression(arr: arr, k: k)
        print(output) // 6
    }
    
    func findLongestArithmeticProgression(arr: [Int], k: Int) -> Int {
       let mySet = Set(arr)
       var maxCount = 0
       
       for index in 0..<arr.count {
           var item = arr[index]
           
           if mySet.contains(item - k) {
               continue
           }
           
           var count = 0
           
           while mySet.contains(item) {
               item = item + k
               count = count + 1
           }
           
           if count > maxCount {
               maxCount = count
           }
       }
       return maxCount
   }
}

extension LongestArithmeticSubsequenceWithGivenDifference {
    func findLongestArithmeticProgression_Solution(arr: [Int], k: Int) -> Int {
        let set = Set(arr)   // remove duplicates + O(1) lookup
        var maxLength = 0

        for x in set {
            // only start counting if x is the beginning of a sequence
            if !set.contains(x - k) {
                var current = x
                var length = 0

                while set.contains(current) {
                    length += 1
                    current += k
                }

                maxLength = max(maxLength, length)
            }
        }

        return maxLength
    }
    
    func findLongestArithmeticProgression_FirstTry(arr: [Int], k: Int) -> Int {
        let arr = arr.sorted { lhs, rhs in
            return lhs < rhs
        }
        
        var index = 0
        var maxCount = 0
        
        while index < arr.count {
            var item = arr[index]
            var count = 0
            
            while arr.contains(item) {
                item = item + k
                count = count + 1
            }
            if count > maxCount {
                maxCount = count
            }
            index = index + 1
        }
        return maxCount
    }
}
