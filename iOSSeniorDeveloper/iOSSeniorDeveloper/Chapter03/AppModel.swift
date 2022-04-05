//
//  AppModel.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 28/03/2022.
//

import Foundation

class AppModel {
    static let instance = AppModel()
    let dataModel = DataModel()
    var appState: AppState = .notStarted // public
    
    func start() throws { // public
        guard dataModel.goal != nil else {
          throw AppError.goalNotSet
        }
        
        appState = .inProgress
    }
    
    func restart() {
      appState = .notStarted
    }
}
