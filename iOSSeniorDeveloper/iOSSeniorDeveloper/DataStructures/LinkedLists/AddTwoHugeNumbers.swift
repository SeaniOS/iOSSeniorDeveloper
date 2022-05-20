//
//  AddTwoHugeNumbers.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 20/05/2022.
//

import Foundation

// https://app.codesignal.com/interview-practice/task/RvDFbsNC3Xn7pnQfH/description
class AddTwoHugeNumbers {
    static let shared = AddTwoHugeNumbers()
    private init() {}
    
    func solution(a: ListNode<Int>?, b: ListNode<Int>?) -> ListNode<Int>? {
        let a = getReversedListNode(a)
        let b = getReversedListNode(b)
        
        var first = a
        var second = b
        var remaining = 0
        
        var currentNode = first
        var previousNode: ListNode<Int>? = nil
        
        while first != nil || second != nil {
            var total = (first?.value ?? 0) + (second?.value ?? 0) + remaining // 10000 -> 0 (1)
        
            if total > 9999 {
                total = total - 10000
                remaining = 1
            } else {
                remaining = 0
            }

            //
            currentNode = ListNode(total)
            currentNode?.next = previousNode
            previousNode = currentNode
            
            first = first?.next
            second = second?.next
            currentNode = first
        }
        
        if remaining == 1 {
            let node = ListNode(1)
            node.next = previousNode
            return node
        }
        return previousNode
    }
}
