//
//  LeetCode225_ImplementStackUsingQueues.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// Queue: reverse order using 2 queues
class LeetCode225_ImplementStackUsingQueues {
    
}

class MyStack {
    
    var q1: Queue<Int>
    var q2: Queue<Int>
    
    init() {
        q1 = Queue<Int>()
        q2 = Queue<Int>()
    }
    
    func push(_ x: Int) {
        if q1.isEmpty {
            q1.push(x)
            
            while !q2.isEmpty {
                q1.push(q2.pop())
            }
        } else {
            q2.push(x)
            
            while !q1.isEmpty {
                q2.push(q1.pop())
            }
        }
    }
    
    func pop() -> Int {
        if q1.isEmpty {
            return q2.pop()
        } else {
            return q1.pop()
        }
    }
    
    func top() -> Int {
        if q1.isEmpty {
            return q2.peek() ?? -1
        } else {
            return q1.peek() ?? -1
        }
    }
    
    func empty() -> Bool {
        q1.isEmpty && q2.isEmpty
    }
}

extension LeetCode225_ImplementStackUsingQueues {
    func demo() {
        test01()
        test02()
    }
    
    private func test01() {
    }
    
    private func test02() {
    }
}
