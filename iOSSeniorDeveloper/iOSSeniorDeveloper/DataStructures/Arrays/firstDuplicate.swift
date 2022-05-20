//
//  firstDuplicate.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 26/04/2022.
//

import Foundation

protocol Arrays {
    
}

/// https://app.codesignal.com/interview-practice/task/pMvymcahZ8dY4g75q/description
class FirstDuplicate: Arrays {
    static let shared = FirstDuplicate()
    private init() {}
    
    /// 1 ≤ a[i] ≤ a.length
    ///
    /// let a: [Int] = [2, 1, 3, 5, 3, 2]
    /// XCTAssertEqual(result, 3)
    ///
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

extension FirstDuplicate {
    func highestVoteSolution(a: [Int]) -> Int {
        var set: Set<Int> = Set()
        for i in a {
            if(set.contains(i)) {
                return i;
            } else {
                set.insert(i);
            }
        }
        return -1;
    }
    
    func secondVoteSolution(a: [Int]) -> Int {
        var a = a
        for index in 0..<a.count {
            let value = abs(a[index])
            a[value - 1] = -a[value - 1]
            if a[value - 1] > 0 { return value }
        }
        return -1
    }
    
    func betterSolution(a: [Int]) -> Int {
        var checkArray = Array.init(repeating: 0, count: a.count)
        
        for index in 0..<a.count {
            let number = a[index]
            if checkArray[number-1] == 1 {
                return number
            }
            
            checkArray[number-1] += 1
        }
        
        return -1
    }
}

































