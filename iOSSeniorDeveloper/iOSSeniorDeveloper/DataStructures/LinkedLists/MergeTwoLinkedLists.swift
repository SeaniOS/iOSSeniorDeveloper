//
//  MergeTwoLinkedLists.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 20/05/2022.
//

import Foundation

class MergeTwoLinkedLists: LinkedLists {
    private init() {}
    static let shared = MergeTwoLinkedLists()
    
    func solution(l1: ListNode<Int>?, l2: ListNode<Int>?) -> ListNode<Int>? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        
        var list1: ListNode<Int>? = l1
        var list2: ListNode<Int>? = l2
        
        var headNode: ListNode<Int>? = nil
        var lastNode: ListNode<Int>? = headNode
        var currentNode: ListNode<Int>? = headNode
        
        while list1 != nil && list2 != nil {
            // myPrint("before: \(getArray(headNode))")
            let firstValue = list1!.value
            let secondValue = list2!.value
            
            if firstValue < secondValue {
                appendNewNode(headNode: &headNode, lastNode: &lastNode, currentNode: &currentNode, nextValue: firstValue)
                
                list1 = list1?.next
            } else {
                appendNewNode(headNode: &headNode, lastNode: &lastNode, currentNode: &currentNode, nextValue: secondValue)
                
                list2 = list2?.next
            }
            // myPrint("after: \(getArray(headNode))")
        }
        
        if list1 == nil {
            lastNode?.next = list2
        } else if list2 == nil {
            lastNode?.next = list1
        }
        return headNode
    }
    
    private func appendNewNode(headNode: inout ListNode<Int>?, lastNode: inout ListNode<Int>?, currentNode: inout ListNode<Int>?, nextValue: Int) {
        let nextNode = ListNode(nextValue)
        
        if headNode == nil {
            headNode = nextNode
            lastNode = headNode
            currentNode = headNode
            return
        }
        
        lastNode?.next = nextNode
        currentNode = lastNode
        
        lastNode = nextNode
    }
}
