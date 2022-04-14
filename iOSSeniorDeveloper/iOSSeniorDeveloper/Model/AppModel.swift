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
    private(set) var appState: AppState = .notStarted {
      didSet {
        stateChangedCallback?(self)
      }
    }
    var stateChangedCallback: ((AppModel) -> ())?
}

extension AppModel {
    func start() throws {
        guard dataModel.goal != nil else {
            throw AppError.goalNotSet
        }
        
        appState = .inProgress
    }
    
    func pause() {
        appState = .paused
    }
    
    func restart() {
        appState = .notStarted
        dataModel.sentAlerts.removeAll()
    }
    
    func setToCaught() {
        appState = .caught
    }
    
    func setToComplete() {
        appState = .completed
    }
}
