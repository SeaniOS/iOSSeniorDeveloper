//
//  AppModel.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 28/03/2022.
//

import Foundation

class AppModel {
    static let instance = AppModel()
    var appState: AppState = .notStarted // public
    func start() { // public
        appState = .inProgress
    }
}
