//
//  CashRegister.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 24/03/2022.
//

import Foundation

class CashRegister {
    var availableFunds: Decimal
    var transactionTotal: Decimal = 0
    
    init(availableFunds: Decimal) {
        self.availableFunds = availableFunds
    }
    
    func addItem(_ cost: Decimal) {
        transactionTotal += cost
    }
}
