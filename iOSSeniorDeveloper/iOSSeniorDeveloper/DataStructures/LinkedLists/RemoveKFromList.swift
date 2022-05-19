//
//  RemoveKFromList.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 19/05/2022.
//

import Foundation

protocol LinkedList {
    
}

 // Singly-linked lists are already defined with this interface:
class ListNode<T> {
     var value: T
     var next: ListNode<T>?
     
     init(_ x: T) {
         self.value = x
         self.next = nil
     }
 }


// https://app.codesignal.com/interview-practice/task/gX7NXPBrYThXZuanm/description
class RemoveKFromList: LinkedList {
    static let shared = RemoveKFromList()
    private init() {}
    
    // [3, 1, 2, 3, 4, 5]
    // -> [1, 2, 4, 5]
    func solution(l: ListNode<Int>?, k: Int) -> ListNode<Int>? {
        guard let l = l else { return nil }
        // k at first position
        guard let headNode = removedFirstListNode(l: l, k: k) else { return nil }
        
        //
        var currentNode = headNode
        while currentNode.next != nil {
            let nextNode = currentNode.next!
            
            if nextNode.value == k {
                currentNode.next = nextNode.next
                
                // last node
                if nextNode.next == nil { return headNode }
            } else {
                currentNode = nextNode
            }
        }
        return headNode
    }
    
    func removedFirstListNode(l: ListNode<Int>?, k: Int) -> ListNode<Int>? {
        guard let l = l else { return nil }
        if l.value == k {
            if l.next == nil { return nil }
            return removedFirstListNode(l: l.next!, k: k)
        } else {
            return l
        }
    }
}

extension RemoveKFromList {
    func highestVoteSolution(l: ListNode<Int>?, k: Int) -> ListNode<Int>? {
        var node = l
        while node != nil && node?.next != nil {
            if node?.next?.value == k {
                node?.next = node?.next?.next
            } else {
                node = node?.next
            }
        }
        return l?.value == k ? l?.next : l
    }
}
