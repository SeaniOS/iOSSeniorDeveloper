//
//  StepCountControllerTests.swift
//  FitNessTests
//
//  Created by Đỗ Hoàng Sơn on 29/03/2022.
//

import XCTest
@testable import iOSSeniorDeveloper // open, public & internal

class StepCountControllerTests: XCTestCase {
    var sut: StepCountController!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = StepCountController()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testController_whenStartTapped_appIsInProgress() {
        // when
        sut.startStopPause(nil)
        // then
        let state = AppModel.instance.appState
        XCTAssertEqual(state, AppState.inProgress)
    }
    
    // MARK: - Initial State
    func testController_whenCreated_buttonLabelIsStart() {
        // given
        sut.viewDidLoad()
        
        let text = sut.startButton.title(for: .normal)
        XCTAssertEqual(text, AppState.notStarted.nextStateButtonLabel)
    }
    // MARK: - In Progress
    func testController_whenStartTapped_buttonLabelIsPause() {
        // when
        sut.startStopPause(nil)
        // then
        let text = sut.startButton.title(for: .normal)
        XCTAssertEqual(text, AppState.inProgress.nextStateButtonLabel)
    }
}
