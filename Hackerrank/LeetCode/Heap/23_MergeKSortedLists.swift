//
//  23_MergeKSortedLists.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 24/3/26.
//

import Foundation
/// Difficulty: Hard
class Heap_23_MergeKSortedLists {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var minHeap = MinHeap<ListNode>()
        
        for list in lists {
            if let list = list {
                minHeap.add(list)
            }
        }
        
        let head = ListNode(-1)
        var current = head
        
        while !minHeap.isEmpty {
            let node = minHeap.poll()!
            current.next = node
            current = node
            
            if let next = node.next {
                minHeap.add(next)
            }
        }
        
        return head.next
    }
}

extension Heap_23_MergeKSortedLists {
    func test() {
        let lists = [[1,4,5].toList(),[1,3,4].toList(),[2,6].toList()]
        let output = mergeKLists(lists)
        output?.printList()
    }
}

/*
Example 1:

Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted linked list:
1->1->2->3->4->4->5->6
*/
