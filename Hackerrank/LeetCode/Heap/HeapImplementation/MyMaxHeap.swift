//
//  MyMaxHeap.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 27/2/26.
//

import Foundation

//     10
//  11    13
// 9  8  x

struct MyMaxHeap {
    var heap: [Int] = []
    
    var peak: Int? {
        return heap.first
    }
    
    var count: Int {
        return heap.count
    }
    
    mutating func add(_ value: Int) {
        heap.append(value)
        heapifyUp()
    }
    
    mutating func poll() -> Int? {
        if heap.isEmpty { return nil }
        
        if heap.count == 1 { return heap.removeLast() }
        
        // let item = heap[0]
        heap.swapAt(0, heap.count - 1)
        let item = heap.removeLast()
        
        heapifyDown()
        return item
    }
    
    mutating func heapifyUp() {
        var childIndex = heap.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && heap[childIndex] > heap[parentIndex] { // childIndex > 0: childIndex should not parent
            heap.swapAt(childIndex, parentIndex)
            
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func heapifyDown() {
        var parent = 0 // 0 instead of heap[0]
        
        while true { // while true
            let leftChild = parent * 2 + 1
            let rightChild = leftChild + 1
            var candidate = parent
            
            if leftChild < heap.count && heap[leftChild] > heap[candidate] {
                candidate = leftChild
            }
            
            if rightChild < heap.count && heap[rightChild] > heap[candidate] {
                candidate = rightChild
            }
            
            if candidate == parent { return } // return instead of break
            
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
