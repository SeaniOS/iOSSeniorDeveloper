//
//  ArraysTests.swift
//  iOSSeniorDeveloperTests
//
//  Created by Đỗ Hoàng Sơn on 26/04/2022.
//

import XCTest
@testable import iOSSeniorDeveloper

class ArraysTests: XCTestCase {
    
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
    
    func testIsCryptSolution() {
        let crypt: [String] = ["SEND", "MORE", "MONEY"]
        let solution: [[Character]] = [
            ["O", "0"],
            ["M", "1"],
            ["Y", "2"],
            ["E", "5"],
            ["N", "6"],
            ["D", "7"],
            ["R", "8"],
            ["S", "9"]
        ]
        XCTAssertTrue(IsCryptSolution.shared.solution(crypt: crypt, solution: solution))
        
        let crypt002: [String] = ["TEN", "TWO", "ONE"]
        let solution002: [[Character]] = [
            ["O", "1"],
            ["T", "0"],
            ["W", "9"],
            ["E", "5"],
            ["N", "4"]
        ]
        XCTAssertFalse(IsCryptSolution.shared.solution(crypt: crypt002, solution: solution002))
    }
}
