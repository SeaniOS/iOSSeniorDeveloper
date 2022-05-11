//
//  ArraysTests.swift
//  iOSSeniorDeveloperTests
//
//  Created by Đỗ Hoàng Sơn on 26/04/2022.
//

import XCTest
@testable import iOSSeniorDeveloper

class ArraysTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFirstDuplicate() {
        XCTAssertEqual(3, FirstDuplicate.shared.betterSolution(a: [2, 1, 3, 5, 3, 2]))
        XCTAssertEqual(2, FirstDuplicate.shared.betterSolution(a: [2, 2]))
        XCTAssertEqual(-1, FirstDuplicate.shared.betterSolution(a: [2, 4, 3, 5, 1]))
    }

    func testFirstNotRepeatingCharacter() {
        XCTAssertEqual("c", FirstNotRepeatingCharacter.shared.solution(s: "abacabad"))
        XCTAssertEqual("_", FirstNotRepeatingCharacter.shared.solution(s: "abacabaabacaba"))
    }
    
    func testRotateImage() {
        let input = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        let output = [
            [7, 4, 1],
            [8, 5, 2],
            [9, 6, 3]
        ]
        XCTAssertEqual(output, RotateImage.shared.solution(a: input))
    }
    
    func testSudoku2() {
        let grid01: [[Character]] = [
            [".", ".", ".", "1", "4", ".", ".", "2", "."],
            [".", ".", "6", ".", ".", ".", ".", ".", "."],
            ["1", ".", ".", "2", ".", ".", "3", ".", "."],
            [".", ".", "1", ".", ".", ".", ".", ".", "."],
            [".", "6", "7", ".", ".", ".", ".", ".", "9"],
            ["4", ".", ".", ".", ".", ".", "8", "1", "."],
            [".", "3", ".", ".", ".", ".", ".", ".", "6"],
            [".", ".", ".", ".", ".", "7", ".", ".", "."],
            [".", ".", ".", "5", ".", ".", ".", "7", "."]]
        XCTAssertTrue(Sudoku2.shared.solution(grid: grid01))
        
        let grid02: [[Character]] = [
            [".", ".", ".", ".", "2", ".", ".", "9", "."],
            [".", ".", ".", ".", "6", ".", ".", ".", "."],
            ["7", "1", ".", ".", "7", "5", ".", ".", "."],
            [".", "7", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", "8", "3", ".", ".", "."],
            [".", ".", "8", ".", ".", "7", ".", "6", "."],
            [".", ".", ".", ".", ".", "2", ".", ".", "."],
            [".", "1", ".", "2", ".", ".", ".", ".", "."],
            [".", "2", ".", ".", "3", ".", ".", ".", "."]]
        XCTAssertFalse(Sudoku2.shared.solution(grid: grid02))
    }
}
