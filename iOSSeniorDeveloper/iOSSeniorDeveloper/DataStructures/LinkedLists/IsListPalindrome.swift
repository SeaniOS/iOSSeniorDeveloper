//
//  IsListPalindrome.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 19/05/2022.
//

import Foundation

// https://app.codesignal.com/interview-practice/task/HmNvEkfFShPhREMn4/description
class IsListPalindrome: LinkedList {
    static let shared = IsListPalindrome()
    private init() {}
    
    func solution(l: ListNode<Int>?) -> Bool {
        guard let l = l else { return true }
        var array = [Int]()
        array.append(l.value)
        
        var head = l
        while head.next != nil {
            array.append(head.next!.value)
            head = head.next!
        }
        
        print("✅")
        print(array)
        let reversedArray: [Int] = array.reversed()
        return array == reversedArray
    }
}

extension IsListPalindrome {
    func highestVoteSolution(l: ListNode<Int>?) -> Bool {
        
        // move pointer1 every step and
        // pointer2 every other step
        var pointerOne = l
        var pointerTwo = l
        var steps = 1
        
        // find middle of array
        while pointerOne != nil {
            pointerOne = pointerOne?.next
            if steps == 2 {
                pointerTwo = pointerTwo?.next
                steps = 0
            }
            steps += 1
        }
        
        
        // Reverse middle of list
        // 0a, 1, 0b
        // pointerTwo = 1
        // nextNode = 1
        // currNode = 1
        // prevNode = nil
        var nextNode = pointerTwo
        var currNode = pointerTwo
        var prevNode: ListNode<Int>? = nil
        // ???
        // nextNode = 0b ✅
        // currNode?.next = nil
        // prevNode = 1 -> nil ⚠️
        // currNode = 0b ✅
        
        // nextNode = nil ✅
        // currNode?.next = 1
        // prevNode = 0b -> 1 ⚠️
        // currNode = nil ✅
        while currNode != nil {
            nextNode = currNode?.next
            currNode?.next = prevNode
            prevNode = currNode
            currNode = nextNode
        }
        
        // Check for equality
        var middle = prevNode
        var begins = l
        while middle != nil {
            if middle?.value != begins?.value {
                return false
            }
            middle = middle?.next
            begins = begins?.next
        }
        
        return true
    }
}
