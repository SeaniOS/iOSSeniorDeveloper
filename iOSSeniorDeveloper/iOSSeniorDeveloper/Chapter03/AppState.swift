//
//  AppState.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 28/03/2022.
//

import Foundation

enum AppState {
    case notStarted
    case inProgress
    
    var nextStateButtonLabel: String {
        switch self {
        case .notStarted:
            return "Start"
        case .inProgress:
            return "Pause"
        }
    }
}
