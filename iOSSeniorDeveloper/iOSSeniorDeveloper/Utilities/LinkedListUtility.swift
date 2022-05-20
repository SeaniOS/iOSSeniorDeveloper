//
//  LinkedListUtility.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 20/05/2022.
//

import Foundation

// Singly-linked lists are already defined with this interface:
class ListNode<T> {
    var value: T
    var next: ListNode<T>?
    
    init(_ x: T) {
        self.value = x
        self.next = nil
    }
}

func getReversedListNode(_ a: ListNode<Int>?) -> ListNode<Int>? {
    var head = a
    var current = a
    var previous: ListNode<Int>? = nil
    while current != nil {
        head = current?.next
        
        current?.next = previous
        previous = current
        
        current = head
        
    }
    return previous
}

func getListNode(_ array: [Int]) -> ListNode<Int>? {
    guard array.count > 0 else { return nil }
    let firstNode = ListNode(array[0])
    var lastNode = firstNode
    
    guard array.count > 1 else { return firstNode }
    for index in 1..<array.count {
        let node = ListNode(array[index])
        lastNode.next = node
        
        lastNode = node
    }
    return firstNode
}

func getArray(_ listNode: ListNode<Int>?) -> [Int] {
    guard let listNode = listNode else { return [] }
    var array = [Int]()
    array.append(listNode.value)
    var currentNode = listNode
    
    while currentNode.next != nil {
        let nextNode = currentNode.next!
        array.append(nextNode.value)
        currentNode = nextNode
    }
    return array
}
