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
    
    override func setUp() {
        super.setUp()
        /*
        let rootController = loadRootViewController()
        sut = rootController.stepController
        */
        // sut.loadViewIfNeeded()
        sut = loadRootViewController()
    }
    
    override func tearDown() {
        AppModel.instance.dataModel.goal = nil
        AppModel.instance.restart()
        sut.updateUI() // sut = nil -> part of the whole app's state cycle
        super.tearDown()
    }
    
    // MARK: - Initial State
    func testController_whenCreated_buttonLabelIsStart() {
        let text = sut.startButton.title(for: .normal)
        XCTAssertEqual(text, AppState.notStarted.nextStateButtonLabel)
    }
    // MARK: - In Progress
    func testController_whenStartTapped_buttonLabelIsPause() {
        // given
        givenGoalSet()
        // when
        sut.startStopPause(nil)
        // then
        let text = sut.startButton.title(for: .normal)
        XCTAssertEqual(text, AppState.inProgress.nextStateButtonLabel)
    }
    
    func testController_whenStartTapped_appIsInProgress() {
        // given
        givenGoalSet()
        // when
        sut.startStopPause(nil)
        // then
        let state = AppModel.instance.appState
        XCTAssertEqual(state, AppState.inProgress)
    }
    
    // MARK: - Given:
    func givenGoalSet() {
        AppModel.instance.dataModel.goal = 1000
    }
    
    func givenInProgress() {
        givenGoalSet()
        sut.startStopPause(nil)
    }
    
    // MARK: - Goal:
    func testDataModel_whenGoalUpdate_updatesToNewGoal() {
        // when
        sut.updateGoal(newGoal: 50)
        // then
        XCTAssertEqual(AppModel.instance.dataModel.goal, 50)
    }
    
    // MARK: - Chase View:
    func testChaseView_whenLoaded_isNotStarted() {
        // when loaded, then
        let chaseView = sut.chaseView
        XCTAssertEqual(chaseView.state, AppState.notStarted)
    }
    
    func testChaseView_whenInProgress_viewIsInProgress() {
        // given
        givenInProgress()
        // then
        let chaseView = sut.chaseView
        XCTAssertEqual(chaseView.state, AppState.inProgress)
    }
}
