//
//  ListNode.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 24/3/26.
//

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    func printList() {
        let head = self
        var current: ListNode? = head
        
        while current != nil {
            print(current!.val)
            current = current!.next
        }
    }
}

extension ListNode: Comparable {
    public static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val < rhs.val
    }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
}

extension Collection where Element == Int {
    func toList() -> ListNode? {
        let tempHead = ListNode(-1)
        var current = tempHead
        
        for value in self {
            let node = ListNode(value)
            current.next = node // reference type
            current = node
        }
        
        return tempHead.next
    }
}
