//
//  LinkedListsTests.swift
//  iOSSeniorDeveloperTests
//
//  Created by Đỗ Hoàng Sơn on 19/05/2022.
//

import XCTest
@testable import iOSSeniorDeveloper

class LinkedListsTests: XCTestCase {
    func testRemoveKFromList() {
        XCTAssertEqual(getArray(getListNode([1, 2, 4, 5])),
                       getArray(RemoveKFromList.shared.solution(l: getListNode([3, 1, 2, 3, 4, 5]), k: 3)))
        
        XCTAssertEqual(getArray(getListNode([1, 2, 3, 4, 5, 6, 7])),
                       getArray(RemoveKFromList.shared.solution(l: getListNode([1, 2, 3, 4, 5, 6, 7]), k: 10)))
        
        XCTAssertEqual(getArray(getListNode([])),
                       getArray(RemoveKFromList.shared.solution(l: getListNode([1000, 1000]), k: 1000)))
    }
    
    func testIsListPalindrome() {
        XCTAssertTrue(IsListPalindrome.shared.highestVoteSolution(l: getListNode([0, 1, 0])))
        XCTAssertFalse(IsListPalindrome.shared.highestVoteSolution(l: getListNode([1, 2, 2, 3])))
    }
}

extension LinkedListsTests {
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
}
