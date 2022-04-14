//
//  RootViewController.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 08/04/2022.
//

import UIKit

class RootViewController: UIViewController {
    @IBOutlet weak var alertContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        add(StepCountController(), frame: view.frame)
        view.bringSubviewToFront(alertContainer)
        alertContainer.isHidden = true
        
        AlertCenter.listenForAlerts { center in
            self.alertContainer.isHidden = center.alertCount == 0 // false
        }
    }

}

@nonobjc extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)
        
        if let frame = frame {
            child.view.frame = frame
        }
        
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
