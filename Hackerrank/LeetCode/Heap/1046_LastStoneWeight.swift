//
//  1046_LastStoneWeight.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 23/3/26.
//

import Foundation

class Heap_1046_LastStoneWeight {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var maxHeap = MyMaxHeap()
        
        for stone in stones {
            maxHeap.add(stone)
        }
        print(maxHeap)
        
        while maxHeap.count >= 2 {
            guard let first = maxHeap.poll(), let second = maxHeap.poll() else { return 0 }
            
            if first != second {
                maxHeap.add(first - second)
            }
        }
        
        if let last = maxHeap.poll() {
            return last
        }
        
        return 0
    }
}

extension Heap_1046_LastStoneWeight {
    func test() {
        let stones = [2,7,4,1,8,1]
        let result = lastStoneWeight(stones)
        print(result)
    }
}

/*
Example 1:

Input: stones = [2,7,4,1,8,1]
Output: 1
Explanation:
We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of the last stone.
*/
