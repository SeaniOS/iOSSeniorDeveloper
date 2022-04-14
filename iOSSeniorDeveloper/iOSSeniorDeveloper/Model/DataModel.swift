//
//  DataModel.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 29/03/2022.
//

import Foundation

class DataModel {
    var goalReached: Bool {
        if let goal = goal, steps >= goal, !caught {
            return true
        }
        return false
    }
    var goal: Int?
    var steps: Int = 0 {
        didSet {
            updateForSteps()
        }
    }
    
    // MARK: - Nessie
    let nessie = Nessie()
    var distance: Double = 0
    var caught: Bool {
        return distance > 0 && nessie.distance >= distance
    }
    
    // MARK: - Alerts
    var sentAlerts: [Alert] = []
}

// MARK: - Updates due to distance
extension DataModel {
    /*
    func updateForSteps() {
        guard let goal = goal else { return }
        if Double(steps) == Double(goal) {
            AlertCenter.instance.postAlert(alert: Alert.goalComplete)
            return
        }
        
        if Double(steps) >= Double(goal) * 0.75 {
            AlertCenter.instance.postAlert(alert: Alert.milestone75Percent)
            return
        }
        
        if Double(steps) >= Double(goal) * 0.5 {
            AlertCenter.instance.postAlert(alert: Alert.milestone50Percent)
            return
        }
        
        if Double(steps) >= Double(goal) * 0.25 {
            AlertCenter.instance.postAlert(alert: Alert.milestone25Percent)
        }
    }
    */
    
    func updateForSteps() {
        checkThreshold(percent: 0.25, alert: .milestone25Percent)
        checkThreshold(percent: 0.50, alert: .milestone50Percent)
        checkThreshold(percent: 0.75, alert: .milestone75Percent)
        checkThreshold(percent: 1.00, alert: .goalComplete)
    }
    
    private func checkThreshold(percent: Double, alert: Alert) {
        guard !sentAlerts.contains(alert), let goal = goal else { return }
        if Double(steps) >= Double(goal) * percent  {
            AlertCenter.instance.postAlert(alert: alert)
            sentAlerts.append(alert)
        }
    }
}

class Nessie {
    var distance: Double = 0
}
