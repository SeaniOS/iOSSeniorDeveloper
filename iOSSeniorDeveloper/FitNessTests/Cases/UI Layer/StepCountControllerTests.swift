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
        
        let rootController = loadRootViewController()
        sut = rootController.stepController
        
        // sut.loadViewIfNeeded()
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

    // MARK: - When:
    func whenCaught() {
        AppModel.instance.setToCaught()
    }
    
    func whenCompleted() {
        AppModel.instance.setToComplete()
    }
}

// MARK: - Given:
extension StepCountControllerTests {
    func givenGoalSet() {
        AppModel.instance.dataModel.goal = 1000
    }
    
    func givenInProgress() {
        givenGoalSet()
        sut.startStopPause(nil)
    }
    
    func expectTextChange() -> XCTestExpectation {
        return keyValueObservingExpectation(for: sut.startButton,
                                               keyPath: "titleLabel.text")
    }
}
/*
// MARK: - Terminal States
extension StepCountControllerTests {
    func testController_whenCaught_buttonLabelIsTryAgain() {
        // given
        givenInProgress()
        // let exp = expectation(description: "button title change")
        // let observer = ButtonObserver()
        // observer.observe(sut.startButton, expectation: exp)
        let exp = expectTextChange()
        // when
        whenCaught()
        // then
        // waitForExpectations(timeout: 1)
        wait(for: [exp], timeout: 1)
        let text = sut.startButton.title(for: .normal)
        XCTAssertEqual(text, AppState.caught.nextStateButtonLabel)
    }
    func testController_whenComplete_buttonLabelIsStartOver() {
        // given
        givenInProgress()
        let exp = expectation(description: "button title change")
        let observer = ButtonObserver()
        observer.observe(sut.startButton, expectation: exp)
        // when
        whenCompleted()
        // then
        waitForExpectations(timeout: 1)
        let text = sut.startButton.title(for: .normal)
        XCTAssertEqual(text, AppState.completed.nextStateButtonLabel)
    }
}
*/
