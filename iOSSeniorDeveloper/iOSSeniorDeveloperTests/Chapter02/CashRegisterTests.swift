//
//  CashRegisterTests.swift
//  iOSSeniorDeveloperTests
//
//  Created by Đỗ Hoàng Sơn on 24/03/2022.
//

import XCTest

class CashRegisterTests: XCTestCase {
    var availableFunds: Decimal!
    var itemCost: Decimal!
    var sut: CashRegister!
    
    override func setUp() {
        super.setUp()
        availableFunds = 100
        itemCost = 42
        sut = CashRegister(availableFunds: availableFunds) // sus = system under test
    }
    
    override func tearDown() {
        availableFunds = nil
        itemCost = nil
        sut = nil
        super.tearDown()
    }
    
    func testInitAvailableFunds_setsAvailableFunds() {
        XCTAssertEqual(sut.availableFunds, availableFunds)
    }
    
    func testAddItem_oneItem_addsCostToTransactionTotal() {
        // when
        sut.addItem(itemCost)
        
        // then
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
    
    func testAddItem_twoItems_addsCostsToTransactionTotal() {
        // given
        let itemCost2 = Decimal(20)
        let expectedTotal = itemCost + itemCost2
        // when
        sut.addItem(itemCost)
        sut.addItem(itemCost2)
        // then
        XCTAssertEqual(sut.transactionTotal, expectedTotal)
    }
}

// CashRegisterTests.defaultTestSuite.run()
