//
//  RemovableIndices.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 30/12/25.
//

import Foundation

/*
Given two strings, str1, and str2, where str1 contains exactly one character more than str2, find the indices of the characters in str1 that can be removed to make str1 equal to str2. Return the array of indices in increasing order. If it is not possible, return the array [-1].
Note: Use 0-based indexing.
Example
str1 = "abdgggda"
str2 = "abdggda"
Any "g" character at positions 3, 4, or 5 can be deleted to obtain str2. Return [3, 4, 5].
*/

class RemovableIndices {
    func demo() {
        let str1 = "abdgggda"
        let str2 = "abdggda"
        
        let output = removableIndices(str1, str2)
        print(output) // [3, 4, 5]
    }
    
    private func removableIndices(_ str1: String, _ str2: String) -> [Int] {
        let a: [Character] = Array(str1)
        let b = Array(str2)
        print(a)
        
        let n = a.count
        let m = b.count
        
        // str1 must be exactly one character longer than str2
        guard n == m + 1 else {
            return [-1]
        }
        
        // prefix[i] = number of matching characters from start up to i
        var prefix = Array(repeating: 0, count: n)
        var j = 0
        for i in 0..<n {
            if j < m && a[i] == b[j] {
                // characters are matched
                prefix[i] = (i > 0 ? prefix[i - 1] : 0) + 1
                // Nếu i > 0 → kế thừa số ký tự đã khớp trước đó,
                // +1 vì vừa khớp thêm 1 ký tự
                j += 1
            } else {
                prefix[i] = (i > 0 ? prefix[i - 1] : 0)
                // Không tăng số ký tự khớp
                // Nhưng giữ nguyên kết quả trước đó
            }
        }
        
        // suffix[i] = number of matching characters from end starting at i
        var suffix = Array(repeating: 0, count: n)
        j = m - 1
        for i in stride(from: n - 1, through: 0, by: -1) {
            if j >= 0 && a[i] == b[j] {
                suffix[i] = (i < n - 1 ? suffix[i + 1] : 0) + 1
                j -= 1
            } else {
                suffix[i] = (i < n - 1 ? suffix[i + 1] : 0)
            }
        }
        
        // Check valid removal positions
        print("prefix: \(prefix)")
        print("suffix: \(suffix)")
        var result: [Int] = []
        for i in 0..<n {
            let leftMatch = (i > 0) ? prefix[i - 1] : 0
            let rightMatch = (i < n - 1) ? suffix[i + 1] : 0
            
            if leftMatch + rightMatch == m {
                print("i: \(i)")
                print("leftMatch: \(leftMatch)")
                print("rightMatch: \(rightMatch)")
                result.append(i)
            }
            // prefix[i - 1] + suffix[i + 1] == m
            // prefix = [1,2,3,4,5,5,6,7] // abdgggda
            // suffix = [7,6,5,4,4,3,2,1] // abdggda
            // [3, 4, 5]
        }
        
        return result.isEmpty ? [-1] : result
    }
}

// A two-pointer solution
/*
 var prefix = Array(repeating: 0, count: n)
 var j = 0

 for i in 0..<n {
     if j < m && a[i] == b[j] {
         j += 1
     }
     prefix[i] = j
 }
 */

/*
 var suffix = Array(repeating: 0, count: n)
 var j = m - 1

 for i in stride(from: n - 1, through: 0, by: -1) {
     if j >= 0 && a[i] == b[j] {
         j -= 1
     }
     suffix[i] = m - 1 - j
 }
 */

// suffix[i] = m - 1 - j
// (M-1) - (M-1) // j bắt đầu ở m - 1
// (M-1) - (M-1 - 1) = 1 // Mỗi lần khớp → j -= 1

// prefix[i - 1] + suffix[i + 1] == m

extension RemovableIndices {
    func getRemovableIndices_FirstTry(str1: String, str2: String) -> [Int] {
        var indicies = [Int]()
        
        for i in 0..<str1.count {
            var temp = str1
            
            let index = str1.index(str1.startIndex, offsetBy: i)
            temp.remove(at: index)
            
            if temp == str2 {
                indicies.append(i)
            }
        }
        
        if indicies.isEmpty {
            return [-1]
        }
        
        return indicies
    }
}

extension RemovableIndices {
    func getRemovableIndices_SecondTry(str1: String, str2: String) -> [Int] {
        var indicies = [Int]()
        // print("str1: \(str1)")
        // print("str2: \(str2)")
        
        for i in 0..<str1.count {
            // print("i: \(i)")
            
            let sameBefore = before(str: str1, i: i) == before(str: str2, i: i)
            let sameAfter = after(str: str1, i: i) == afterStr2(str: str2, i: i)
            if sameBefore && sameAfter {
                indicies.append(i)
            }
        }
        
        if indicies.isEmpty {
            return [-1]
        }
        
        return indicies
    }

    private func before(str: String, i: Int) -> String {
        let index = str.index(str.startIndex, offsetBy: i)
        let before = str[..<index]
        // print("before: \(before)")
        return String(before)
    }

    private func after(str: String, i: Int) -> String {
        let index = str.index(str.startIndex, offsetBy: i+1) // removing at current index
        let after = str[index..<str.endIndex]
        // print("after: \(after)")
        return String(after)
    }

    private func afterStr2(str: String, i: Int) -> String {
        let index = str.index(str.startIndex, offsetBy: i)
        let after = str[index..<str.endIndex]
        // print("after: \(after)")
        return String(after)
    }
}
