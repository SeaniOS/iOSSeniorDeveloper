//
//  AddTwoHugeNumbers.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 20/05/2022.
//

import Foundation

// https://app.codesignal.com/interview-practice/task/RvDFbsNC3Xn7pnQfH/description
class AddTwoHugeNumbers: LinkedLists {
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

extension AddTwoHugeNumbers {
    func highestVoteSolution(a: ListNode<Int>?, b: ListNode<Int>?) -> ListNode<Int>? {
        var aCurrent = reverseList(a)
        var bCurrent = reverseList(b)
        
        var newList: ListNode<Int>? = nil
        var carry = 0
        
        while aCurrent != nil || bCurrent != nil {
            var newVal = 0
            newVal += aCurrent?.value ?? 0
            newVal += bCurrent?.value ?? 0
            
            if carry == 1 {
                newVal += 1
                carry = 0
            }
            
            if newVal >= 10000 {
                carry = 1
                newVal -= 10000
            }
            
            let newNode = ListNode<Int>(newVal)
            
            newNode.next = newList
            newList = newNode
            
            aCurrent = aCurrent?.next
            bCurrent = bCurrent?.next
        }
        
        if carry == 1 {
            let newNode = ListNode<Int>(1)
            newNode.next = newList
            newList = newNode
        }
        
        return newList
    }

    private func reverseList(_ list: ListNode<Int>?) -> ListNode<Int>? {
        var current = list
        var next = current?.next
        var prev: ListNode<Int>? = nil
        
        while current != nil {
            current?.next = prev
            prev = current
            current = next
            next = current?.next
        }
        
        return prev
    }
}
