//
//  Notification+Tests.swift
//  FitNessTests
//
//  Created by Đỗ Hoàng Sơn on 14/04/2022.
//

import Foundation

@testable import iOSSeniorDeveloper
extension Notification {
    var alert: Alert? {
        return userInfo?[AlertNotification.Keys.alert] as? Alert
    }
}
