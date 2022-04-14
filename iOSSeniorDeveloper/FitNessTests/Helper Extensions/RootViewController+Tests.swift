//
//  RootViewController+Tests.swift
//  FitNessTests
//
//  Created by Đỗ Hoàng Sơn on 30/03/2022.
//

import UIKit
@testable import iOSSeniorDeveloper

extension RootViewController {
    var stepController: StepCountController {
        return children.first { $0 is StepCountController } as! StepCountController
    }
}
