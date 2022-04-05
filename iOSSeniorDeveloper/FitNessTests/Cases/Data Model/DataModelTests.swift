//
//  DataModelTests.swift
//  FitNessTests
//
//  Created by Đỗ Hoàng Sơn on 29/03/2022.
//

import XCTest
@testable import iOSSeniorDeveloper

class DataModelTests: XCTestCase {
    var sut: DataModel!
    /*
    override func setUpWithError() throws { // throws
        super.setUp()
        sut = DataModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    */
    override func setUp() {
        super.setUp()
        sut = DataModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Goal
    func testModel_whenStarted_goalIsNotReached() {
        XCTAssertFalse(sut.goalReached, "goalReached should be false when the model is created")
    }
    
    func testModel_whenStepsReachGoal_goalIsReached() {
        // given
        sut.goal = 1000
        // when
        sut.steps = 1000
        // then
        XCTAssertTrue(sut.goalReached)
    }
    
    func testGoal_whenUserCaught_cannotBeReached() {
        //given goal should be reached
        sut.goal = 1000
        sut.steps = 1000
        // when caught by nessie
        sut.distance = 100
        sut.nessie.distance = 100
        // then
        XCTAssertFalse(sut.goalReached)
    }
    
    // MARK: - Nessie
    func testModel_whenStarted_userIsNotCaught() {
        XCTAssertFalse(sut.caught)
    }
    
    func testModel_whenUserAheadOfNessie_isNotCaught() {
        // given
        sut.distance = 1000
        sut.nessie.distance = 100
        // then
        XCTAssertFalse(sut.caught)
    }
    func testModel_whenNessieAheadofUser_isCaught() {
        // given
        sut.distance = 100
        sut.nessie.distance = 1000
        // then
        XCTAssertTrue(sut.caught)
    }
    
}
