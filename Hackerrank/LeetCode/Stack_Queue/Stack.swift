//
//  Stack.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 24/3/26.
//

import Foundation

/// LIFO
struct Stack<T> {
    private var array = Array<T>()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T {
        array.removeLast()
    }
}

// FIFO
struct Queue<T> {
    private var array = Array<T>()
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    func peek() -> T? {
        array.first
    }
    
    mutating func pop() -> T {
        array.removeFirst()
    }
    
    var size: Int {
        return array.count
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
}
