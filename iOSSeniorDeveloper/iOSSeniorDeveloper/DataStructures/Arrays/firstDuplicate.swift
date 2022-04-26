//
//  firstDuplicate.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 26/04/2022.
//

import Foundation

/// https://app.codesignal.com/interview-practice/task/pMvymcahZ8dY4g75q/description
class FirstDuplicate {
    static let shared = FirstDuplicate()
    private init() {}
    
    /// 1 ≤ a[i] ≤ a.length
    ///
    /// let a: [Int] = [2, 1, 3, 5, 3, 2]
    ///
    /// XCTAssertEqual(result, 3)
    func solution(a: [Int]) -> Int {
        var minIndex = -1
        
        for index in 0..<a.count-1 {
            if let occurrenceIndex = isDuplicateNumber(numberIndex: index, a: a), minIndex == -1 || occurrenceIndex < minIndex {
                minIndex = occurrenceIndex
            }
        }
        
        return (minIndex == -1) ? -1 : a[minIndex]
    }
    
    private func isDuplicateNumber(numberIndex: Int, a: [Int]) -> Int? {
        var count = 0
        var occurrenceIndex: Int?
        
        for index in numberIndex..<a.count where a[index] == a[numberIndex] {
            count += 1
            
            if count == 2 {
                occurrenceIndex = index
            }
        }
        
        return count >= 2 ? occurrenceIndex : nil
    }
}




































/*
// 1 ≤ a[i] ≤ a.length => Giá trị của phần tử - 1 = index của mảng
func solution(a: [Int]) -> Int {
    var a = a
    for index in 0..<a.count {
        let value = abs(a[index])
        a[value - 1] = -a[value - 1]
        if a[value - 1] > 0 { return value }
    }
    return -1
}
*/
