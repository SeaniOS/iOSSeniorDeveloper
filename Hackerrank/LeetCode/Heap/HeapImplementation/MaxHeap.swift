//
//  MaxHeap.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 27/2/26.
//

import Foundation

struct MaxHeap<T: Comparable> {
    private var heap: [T] = []
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var peek: T? {
        heap.first
    }
    
    var count: Int {
        return heap.count
    }
    
    // Insert
    mutating func add(_ value: T) {
        heap.append(value)
        siftUp(from: heap.count - 1)
    }
    
    // Remove max
    mutating func poll() -> T? {
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
