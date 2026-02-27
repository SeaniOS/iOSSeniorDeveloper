//
//  215_KthLargestElement.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 27/2/26.
//

import Foundation

class Heap_215_KthLargestElement {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var maxHeap = MaxHeap<Int>()
        
        for num in nums {
            maxHeap.add(num)
        }
        
        for _ in 0..<k-1 {
            _ = maxHeap.poll()
        }
        return maxHeap.poll() ?? 0
    }
    
    /*
    var result: Int = -1
    for _ in 0..<k {
        result = maxHeap.poll() ?? -1
    }
    return result
     */
}


extension Heap_215_KthLargestElement {
    func demo() {
        demo1()
        demo2()
    }
    
    private func demo1() {
        let nums = [3,2,1,5,6,4]
        let k = 2
        let output = findKthLargest(nums, k)
        print(output) // 5
    }
    
    private func demo2() {
        let nums = [3,2,3,1,2,4,5,5,6]
        let k = 4
        let output = findKthLargest(nums, k)
        print(output) // 4
    }
}
