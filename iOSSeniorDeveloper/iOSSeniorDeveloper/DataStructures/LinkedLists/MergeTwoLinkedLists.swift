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
        
        while list1 != nil && list2 != nil {
            // myPrint("before: \(getArray(headNode))")
            let firstValue = list1!.value
            let secondValue = list2!.value
            
            if firstValue < secondValue {
                appendNewNode(headNode: &headNode, lastNode: &lastNode, nextValue: firstValue)
                
                list1 = list1?.next
            } else {
                appendNewNode(headNode: &headNode, lastNode: &lastNode, nextValue: secondValue)
                
                list2 = list2?.next
            }
            // myPrint("after: \(getArray(headNode))")
        }
        
        lastNode?.next = (list1 == nil) ? list2 : list1
        return headNode
    }
    
    private func appendNewNode(headNode: inout ListNode<Int>?, lastNode: inout ListNode<Int>?, nextValue: Int) {
        let nextNode = ListNode(nextValue)
        
        if headNode == nil {
            headNode = nextNode
            lastNode = headNode
            return
        }
        
        lastNode?.next = nextNode
        lastNode = nextNode
    }
}

extension MergeTwoLinkedLists {
    func heighestVoteSolution(l1: ListNode<Int>?, l2: ListNode<Int>?) -> ListNode<Int>? {
        var head : ListNode<Int>? = l1
        var a : ListNode<Int>? = l1
        var b : ListNode<Int>? = l2
        let rtn = ListNode(0)
        head = rtn
        while a != nil || b != nil {
            if a != nil && b != nil {
                if a!.value < b!.value {
                    head?.next = a
                    a = a?.next
                }else {
                    head?.next = b
                    b = b?.next
                }
                head = head?.next
            }else {
                head?.next = a == nil ? b  :a
                return rtn.next
            }

        }
        return rtn.next
    }
}
/*
rtn = 0
head = 0
a = 1
 
head.next = a
head = a
*/
