//
//  ViewControllers.swift
//  FitNessTests
//
//  Created by Đỗ Hoàng Sơn on 30/03/2022.
//

import UIKit
@testable import iOSSeniorDeveloper

func loadRootViewController() -> StepCountController { // RootViewController
    let window = UIApplication.shared.windows[0]
    return window.rootViewController as! StepCountController
}
