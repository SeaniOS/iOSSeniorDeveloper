//
//  HackerRankPreparationTests.swift
//  HackerRankPreparationTests
//
//  Created by DO HOANG SON on 23/2/26.
//

import XCTest
@testable import HackerRankPreparation

final class HackerRankPreparationTests: XCTestCase {
    
    var sut: TaskScheduler_Cooldown_MultipleMachines!
    
    override func setUpWithError() throws {
        sut = TaskScheduler_Cooldown_MultipleMachines()
    }

    override func tearDownWithError() throws {
        // sut = nil
    }
    
    func testSomething() {
        let tasks = [1, 1, 2, 1]
        let m = 2
        let k = 2
        
        let output = sut.calculateMinimumTimeUnits(tasks: tasks, m: m, k: k)
        XCTAssertEqual(output, 3)
    }
}
