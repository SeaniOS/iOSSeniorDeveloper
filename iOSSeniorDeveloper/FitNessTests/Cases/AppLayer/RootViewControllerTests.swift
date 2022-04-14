//
//  RootViewControllerTests.swift
//  FitNessTests
//
//  Created by Đỗ Hoàng Sơn on 08/04/2022.
//

import XCTest
@testable import iOSSeniorDeveloper

class RootViewControllerTests: XCTestCase {

    var sut: RootViewController!
    override func setUp() {
        super.setUp()
        sut = loadRootViewController()
    }
    override func tearDown() {
        sut = nil
        AlertCenter.instance.clearAlerts()
        super.tearDown()
    }
    
    // MARK: - Alert Container
    func testWhenLoaded_noAlertsAreShown() {
        sut.viewDidLoad()
        XCTAssertTrue(sut.alertContainer.isHidden)
    }
    
    func testWhenAlertsPosted_alertContainerIsShown() {
        // given
        let exp = expectation(forNotification: AlertNotification.name,
                              object: nil, handler: nil)
        let alert = Alert("show the container")
        // when
        AlertCenter.instance.postAlert(alert: alert)
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertFalse(sut.alertContainer.isHidden)
    }

}
