//
//  ButtonObserver.swift
//  FitNessTests
//
//  Created by Đỗ Hoàng Sơn on 06/04/2022.
//

import Foundation
import XCTest

class ButtonObserver: NSObject {
    var expectation: XCTestExpectation?
    weak var button: UIButton?
    
    func observe(_ button: UIButton,
                 expectation: XCTestExpectation) {
        self.expectation = expectation
        self.button = button
        button.addObserver(self,
                           forKeyPath: "titleLabel.text",
                           options: [.new],
                           context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let expectation = expectation {
            expectation.fulfill()
        } else {
            print("No expectation")
        }
    }
    
    deinit {
        button?.removeObserver(self, forKeyPath: "titleLabel.text")
    }
}
