//
//  LeetCode232_ImplementQueueUsingStacks.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

class MyQueue {
    var stack1: Stack<Int> = Stack()
    var stack2: Stack<Int> = Stack()
    
    init() { }
    
    func push(_ x: Int) {
        stack1.push(x)
    }
    
    func pop() -> Int {
        if stack2.isEmpty {
            while !stack1.isEmpty {
                stack2.push(stack1.pop())
            }
        }
        
        return stack2.pop()
    }
    
    func peek() -> Int {
        if stack2.isEmpty {
            while !stack1.isEmpty {
                stack2.push(stack1.pop())
            }
        }
        
        return stack2.peek() ?? -1
    }
    
    func empty() -> Bool {
        stack1.isEmpty && stack2.isEmpty
    }
}
