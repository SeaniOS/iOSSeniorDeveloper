//
//  AlertCenter.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 08/04/2022.
//

import Foundation
import NotificationCenter

class AlertNotification {
    static let name = NSNotification.Name(rawValue: "Alert")
    
    enum Keys {
        static let alert = "alertKey"
    }
}

class Alert: Equatable {
    static let milestone25Percent = Alert("milestone25Percent")
    static let milestone50Percent = Alert("milestone50Percent")
    static let milestone75Percent = Alert("milestone75Percent")
    static let goalComplete = Alert("goalComplete")
    
    var content: String
    init(_ string: String) {
        self.content = string
    }
    
    static func == (lhs: Alert, rhs: Alert) -> Bool {
        return lhs.content == rhs.content
    }
}

class AlertCenter {
    static let instance = AlertCenter()
    private var alertQueue: [Alert] = []
    var alertCount: Int {
        return alertQueue.count
    }
    
    let notificationCenter = NotificationCenter.default
    
    class func listenForAlerts(_ callback: @escaping (AlertCenter) -> ()) {
        instance.notificationCenter.addObserver(forName: AlertNotification.name,
                                                object: instance,
                                                queue: .main) { _ in
            callback(instance)
        }
    }
    
    func postAlert(alert: Alert) {
        guard !alertQueue.contains(where: { $0.content == alert.content}) else { return }
        alertQueue.append(alert)
        let notification = Notification(name: AlertNotification.name,
                                        object: self,
                                        userInfo: [AlertNotification.Keys.alert: alert])
        notificationCenter.post(notification)
    }
}
// MARK: - Alert Handling
extension AlertCenter {
    func clearAlerts() {
        alertQueue.removeAll()
    }
    
    func clear(alert: Alert) {
        if let index = alertQueue.firstIndex(of: alert) {
            alertQueue.remove(at: index)
        }
    }
}
