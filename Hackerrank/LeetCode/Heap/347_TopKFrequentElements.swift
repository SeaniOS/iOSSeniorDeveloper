//
//  347_TopKFrequentElements.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 25/2/26.
//

import Foundation

class Heap_347_TopKFrequentElements {
    /// Bucket Sort: O(n)
    /// maxHeap: O(n logn)
    /// Swift sort:  O(n logn)
    private func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // frequentDict
        var frequentDict: [Int: Int] = [:]
        for num in nums { // O(n)
            frequentDict[num] = (frequentDict[num] ?? 0) + 1
        }
        print(frequentDict)
        
        // maxHeap
        var maxHeap: [(Int, Int)] = []
        for (num, frequency) in frequentDict { // O(m) <= O(n)
            maxHeap.append((num, frequency))
        }
        maxHeap.sort { $0.1 > $1.1 } // Swift sort dùng Introsort // O(m log m) <= O(n log n)
        print(maxHeap)
        
        var result: [Int] = []
        for i in 0..<k { // O(k) X
            let num = maxHeap[i].0
            result.append(num)
        }

        return result
    }
}

extension Heap_347_TopKFrequentElements {
    func demo() {
        let nums = [1,1,1,2,2,3]
        let k = 2
        let output = topKFrequent(nums, k)
        print(output)
    }
}

/*
 var nums = [3, 10, 5]
 nums.sort(by: >)

 let max = nums.removeFirst()
 */

/*
struct MaxHeap<T: Comparable> {
    private var heap: [T] = []
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var peek: T? {
        heap.first
    }
    
    // Insert
    mutating func push(_ value: T) {
        heap.append(value)
        siftUp(from: heap.count - 1)
    }
    
    // Remove max
    mutating func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 { return heap.removeLast() }
        
        heap.swapAt(0, heap.count - 1)
        let max = heap.removeLast()
        siftDown(from: 0)
        return max
    }
    
    // MARK: - Heap helpers
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && heap[child] > heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = parent * 2 + 1
            let right = left + 1
            var candidate = parent
            
            if left < heap.count && heap[left] > heap[candidate] {
                candidate = left
            }
            if right < heap.count && heap[right] > heap[candidate] {
                candidate = right
            }
            if candidate == parent { return }
            
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
*/
