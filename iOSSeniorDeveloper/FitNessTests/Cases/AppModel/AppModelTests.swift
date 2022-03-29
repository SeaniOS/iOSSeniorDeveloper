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
    
    func testAppModel_whenStarted_isInInProgressState() {
        // 1 given app in not starteds
        // 2 when started
        sut.start()
        // 3 then it is in inProgress
        let observedState = sut.appState
        XCTAssertEqual(observedState, AppState.inProgress)
    }
}
