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
