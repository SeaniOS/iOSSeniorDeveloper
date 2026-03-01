//
//  506_RelativeRanks.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 1/3/26.
//

import Foundation

class Heap_506_RelativeRanks {
    // Brute Force is accepted but Runtime is slow
    func findRelativeRanks(_ score: [Int]) -> [String] {
        print(score)
        
        let sortedScore = score.sorted { $0 > $1 } /// nlogn
        print(sortedScore)
        
        var dict = [Int: Int]() // score : rank
        
        for index in 0..<sortedScore.count {
            dict[sortedScore[index]] = index /// n
        }
        print(dict)
        
        var result: [String] = []
        for index in 0..<score.count { // n
            let rank = dict[score[index], default: 0]
            if rank == 0 {
                result.append("Gold Medal")
            } else if rank == 1 {
                result.append("Silver Medal")
            } else if rank == 2 {
                result.append("Bronze Medal")
            } else {
                result.append("\((rank) + 1)")
            }
        }
        return result
    }
}

extension Heap_506_RelativeRanks {
    func demo() {
        // testCase1()
        testCase2()
    }
    
    private func testCase1() {
        let score = [5,4,3,2,1]
        let output = findRelativeRanks(score)
        print(output)
        // ["Gold Medal","Silver Medal","Bronze Medal","4","5"]
    }
    
    private func testCase2() {
        let score = [10,3,8,9,4]
        let output = findRelativeRanks(score)
        print(output)
        // ["Gold Medal","5","Bronze Medal","Silver Medal","4"]
        
        /*
        [10,3,8,9,4]
        [10,9,8,4,3]
         */
    }
}


