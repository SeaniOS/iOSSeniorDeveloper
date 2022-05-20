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
    
    func testAddTwoHugeNumbers() {
        XCTAssertEqual(getArray(getListNode([9876, 5434, 0])),
                       getArray(AddTwoHugeNumbers.shared.solution(a: getListNode([9876, 5432, 1999]),
                                                                  b: getListNode([1, 8001]))))
        
        XCTAssertEqual(getArray(getListNode([223, 104, 105])),
                       getArray(AddTwoHugeNumbers.shared.solution(a: getListNode([123, 4, 5]),
                                                                  b: getListNode([100, 100, 100]))))
        
        XCTAssertEqual(getArray(getListNode([1, 0, 0, 0, 0, 0, 0])),
                       getArray(AddTwoHugeNumbers.shared.solution(a: getListNode([1]),
                                                                  b: getListNode([9999, 9999, 9999, 9999, 9999, 9999]))))
    }
}
