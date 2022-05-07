//
//  extensionString.swift
//  iOSSeniorDeveloper
//
//  Created by Sơn Đỗ on 07/05/2022.
//

import Foundation

extension String {
    var unicodeValue: Int {
        guard self.count == 1 else { return -1 }
        let value = self.unicodeScalars.first?.value
        guard let value = value else { return -1 }
        return Int(value)
    }
}
