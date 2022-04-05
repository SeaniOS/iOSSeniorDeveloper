//
//  AppModelTests.swift
//  FitNessTests
//
//  Created by Đỗ Hoàng Sơn on 28/03/2022.
//

import XCTest
@testable import iOSSeniorDeveloper

// MARK: - Chapter 3: Driving TDD
class AppModelTests: XCTestCase {
    var sut: AppModel!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = AppModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testAppModel_whenInitialized_isInNotStartedState() {
        let initialState = sut.appState
        XCTAssertEqual(initialState, AppState.notStarted)
    }
    
    func testModelWithNoGoal_whenStarted_throwsError() {
      XCTAssertThrowsError(try sut.start())
    }
    
    func testStart_withGoalSet_doesNotThrow() {
        // given
        givenGoalSet()
        // then
        XCTAssertNoThrow(try sut.start())
    }
    
    func testAppModel_whenStarted_isInInProgressState() {
        // given
        givenGoalSet()
        // 2 when started
        try? sut.start()
        // 3 then it is in inProgress
        let observedState = sut.appState
        XCTAssertEqual(observedState, AppState.inProgress)
    }
    
    // MARK: - Restart
    func testAppModel_whenReset_isInNotStartedState() {
        // given
        givenInProgress()
        // when
        sut.restart()
        // then
        XCTAssertEqual(sut.appState, .notStarted)
    }
    
    // MARK: - Given:
    func givenGoalSet() {
      sut.dataModel.goal = 1000
    }
    
    func givenInProgress() {
      givenGoalSet()
      try! sut.start()
    }
}
